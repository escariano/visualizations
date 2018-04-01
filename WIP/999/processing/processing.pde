
OpenSimplexNoise noise;

float counter = 0;
int radius = 4;

float size = 1;
int step = 400;

void setup() {
  int w = 400;
  size(640, 640, P3D);
  //ortho();

  float fov = PI/3.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), 
    cameraZ/10.0, cameraZ*10.0);
}

void draw() {
  background(51);
  translate(width / 2, height / 4, -width / 2);
  rotateX(-atan(.5));
  rotateY(-QUARTER_PI);

  //pointLight(100, 100, 100, 200, 0, 300);
  directionalLight(248, 102, 24, 0, 1, 0);
  directionalLight(224, 178, 59, -1, 0, 0);
  directionalLight(40, 55, 91, 0, 0, -1);
  ambient(125);
  noStroke();
  //for (float r = 0; r < PI * 2; r = r + 0.5) {
  for (float x = 0; x < size; x = x + 0.03) {
    for (float y = 0; y < size; y = y + 0.03) {

      float i = x + radius * cos(counter);
      float j = y + radius * sin(counter);

      float value = noise(i, j);

      noStroke();
      fill(value * 255);
      stroke(51, value * 255, 126);
      //stroke(255);
      strokeWeight(2);
      pushMatrix();
      translate(x * step, 0, y * step);
      //box(1, 75, 10);
      //rotateX(value * HALF_PI);

      rotateX(value * QUARTER_PI);
      line(0, 0, 0, 0, -55, 0);
      popMatrix();
    }
  }
  //}

  counter = counter + 0.002;
};