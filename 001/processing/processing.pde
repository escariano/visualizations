int stackH = 240;
int h = stackH / 10;
float counter = 0;

int a = 0;

void setup() {
    int w = 400;
    size(640, 640, P3D);
    ortho(-w, w, w, -w, -1000, 1000);
}

void draw() {
    background(51);
    rotateX(atan(.5));
    rotateY(-QUARTER_PI);
        //lights();
    directionalLight(105, 186, 163, 0, 1, 0);
    directionalLight(251, 246, 205, 1, 0, 0);
    directionalLight(160,  95,  86, 0, 0, 1);
    
    //ambientLight(102, 102, 102);
    
    noStroke();
    
    for (int y = -stackH; y < stackH; y = y + h) {
        pushMatrix();
        translate(400, y + 500, 0);
        
        float offset = map(y, -stackH, stackH, -PI, PI );
        float angle = counter + offset;

        

        int w = floor(map(cos(angle), -1, 1, 50, 300));
        int d = floor(map(sin(angle), -1, 1, 50, 300));
        println(w);
        box(w, h, d);
        popMatrix();
        
         
    }

    counter = counter + 0.05;
    
    saveFrame("frames/line-######.png");
    
    if (frameCount > 150) {
      System.exit(0);
    }
};