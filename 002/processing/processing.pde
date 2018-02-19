float counter = PI / 2;
int mainRadius = 100;
int sectionRadius = 100;
int size = sectionRadius / 7;

void setup() {
  int w = 400;
  size(640, 640, P3D);
  ortho();
}

void draw() {
  background(51);
  translate(width / 2, height / 2, 0);
  rotateX(-atan(.5));
  rotateY(-QUARTER_PI);

  pointLight(100, 100, 100, 200, 0, 300);
  directionalLight(248, 102, 24, 0, 1, 0);
  directionalLight(224, 178, 59, -1, 0, 0);
  directionalLight(40, 55, 91, 0, 0, -1);

  noStroke();

  float x = 0;
  float y = 0;

  for (float c = 0; c < PI * 2; c = c + (PI * 2 / 36))
  {
    float angle = counter + c; 

    x = sectionRadius * sin(counter + c);
    y = sectionRadius * cos(counter + c);

    pushMatrix();
    translate(x - mainRadius, y, 0);
    box(size, size, size - ((x - mainRadius) * tan(PI / 4) * 2));
    popMatrix();

    pushMatrix();
    translate(-x + mainRadius, y, 0);
    box(size, size, size + ((-x + mainRadius) * tan(PI / 4) * 2));
    popMatrix();

    pushMatrix();
    translate(0, y, x - mainRadius);
    box(size - ((x - mainRadius) * tan(PI / 4) * 2), size, size);
    popMatrix();

    pushMatrix();
    translate(0, y, -x + mainRadius);
    box(size + ((-x + mainRadius) * tan(PI / 4) * 2), size, size);
    popMatrix();
  }
  counter = counter + 0.01;
};