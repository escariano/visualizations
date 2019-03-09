
OpenSimplexNoise noise;

float counter = 0;
float radius = .8;

float size = .5;
int step = 400;

void setup() {
  size(1000, 1000, P3D);

  float fov = PI/5.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(
    fov, 
    float(width) / float(height), 
    cameraZ / 10.0, 
    cameraZ * 10.0
    );

  frameRate(25);
}

void draw() {
  background(51);

  translate(width / 2, height / 2, -width / 6);
  rotateX(-atan(.5));
  rotateY(-QUARTER_PI);

  pointLight(0, 0, 0, 0, 500, 0);
  directionalLight(50, 219, 198, 0, 1, 0);
  directionalLight(244, 169, 199, -1, 0, 0);
  directionalLight(255, 247, 140, 0, 0, -1);
  ambient(255);

  noStroke();
  shininess(1.0);
  lightSpecular(255, 255, 255);
  for (float x = -size; x <= size; x = x + 0.05) {
    for (float y = -size; y <= size; y = y + 0.05) {

      float i = x + radius * cos(counter);
      float j = y + radius * sin(counter);

      float value = noise(i, j);

      fill(255);
      //fill(map(value, 0, 1, 125, 255));
      pushMatrix();
      translate(x * step, 0, y * step);

      rotateX(map(value, 0, 1, -PI / 6, PI / 6));

      scale(1, 20, 1);
      box(11);
      popMatrix();
    }
  }

  shininess(0.0);
  lightSpecular(0, 0, 0);
  directionalLight(250, 219, 198, 0, 1, 0);
  pushMatrix();
  rotateX(HALF_PI);
  rectMode(CENTER);
  fill(75);
  translate(-10, -10, -200);
  box (410);
  fill(51);
  translate(0, 0, 175);
  rect(0, 0, 10000, 10000);
  popMatrix();
  counter = counter + 0.008;

  if (counter >= TWO_PI) {
    noLoop();
  } else {
    saveFrame("output/005_######.png");
  }
};
