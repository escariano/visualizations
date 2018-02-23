float counter = 0;
int radius = 150;
int sectionRadius = 100;


void setup() {
  int w = 400;
  //frameRate(10);
  size(640, 640, P3D);
  ortho();
}

void draw() {
  background(51);
  translate(width / 2, height / 2, 0);
  rotateX(-atan(.5));
  rotateY(-QUARTER_PI);

  //pointLight(100, 100, 100, 200, 0, 300);
  directionalLight(248, 102, 24, 0, 1, 0);
  directionalLight(224, 178, 59, -1, 0, 0);
  directionalLight(40, 55, 91, 0, 0, -1);
  ambient(125);
  noStroke();

  float g = 0;
  for (float c = 0; c <= 2 * PI; c = c + (2 * PI / 100)) {
    float x = radius * sin(c);
    float z = radius * cos(c);
    float f = 0;
    for (float b = 0; b <= 2 * PI; b = b + (2 * PI / 50)) {

      float offset = 0;
      offset = 5 * sin((b + c + counter)* 6);

      //float offset = 10 * sin(counter + c + b) ;
      float j = (sectionRadius + offset) * sin(b); 
      float k = (sectionRadius + offset) * cos(b); 

      pushMatrix(); 
      translate(x, 0, z); 
      rotateY(c); 
      translate(0, j, k); 
      rotateX(-b); 
      box(14); 
      popMatrix();
      f++;
    }
    g++;
  }
  counter = counter - 0.02;
};