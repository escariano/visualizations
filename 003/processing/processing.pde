int boxSize = 3;
float counter = 0;

void setup() {
  int w = 400;
  frameRate(24);
  size(640, 640, P3D);
  ortho();
}

void draw() {
  background(51);
  translate(width / 2, height / 3, 0);
  scale(7);
  rotateX(-atan(.5));
  rotateY(-QUARTER_PI);

  //pointLight(100, 100, 100, 200, 0, 300);
  directionalLight(115, 208, 159, 0, 1, 0);
  directionalLight(40, 178, 191, -1, 0, 0);
  directionalLight(30, 86, 97, 0, 0, -1);
  ambient(125);
  noStroke();

  for (int i = 0; i < boxSize * 20; i = i + boxSize) {
    int k = Math.abs(i - (boxSize * 10));
    for (int j = 0; j < boxSize * 20; j= j + boxSize) {
      int l = Math.abs(j - (boxSize * 10));
      pushMatrix();
      translate(i, boxSize * sin(counter + l + k), j);
      box(boxSize);
      popMatrix();
    }
  }
  counter = counter + PI / 100;

  saveFrame("res/wave-######.png");

  if (counter > PI * 2) {
    System.exit(0);
  }
};