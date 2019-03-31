let stackH = 240;
let h = stackH / 10;
let counter = 0;

function setup() {
    createCanvas(640, 640, WEBGL);
    ortho(-width / 2, width / 2, height / 2, -height / 2, 0, 1000);
}

function draw() {
    background(51);
    rotateX(atan(.5));
    rotateY(-QUARTER_PI);
        
    directionalLight(105, 186, 163, 0, -1, 0);
    directionalLight(251, 246, 205, -1, 0, 0);
    directionalLight(160,  95,  86, 0, 0, -1);
    ambientMaterial(255);
    noStroke();
    
    for (y = -stackH; y < stackH; y = y + h) {
        push();
        translate(0, y, 0);
        
        let offset = map(y, -stackH, stackH, -PI, PI );
        let angle = counter + offset;

        let w = floor(map(cos(angle), -1, 1, 50, 300));
        let d = floor(map(sin(angle), -1, 1, 50, 300));

        box(w, h, d);
        pop();
    }

    counter = counter + 0.05;
    
};
