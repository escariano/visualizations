void setup() {
  size(720, 720, P3D);
  smooth(8);
  //fullScreen(P3D);
  ortho(-width/2, width/2, -height/2, height/2, -2000, 2000);

  frameRate(30);
}

float counter = 0;

void draw() {
  background(0);
  translate(width / 2, height / 2, 100);

  scale(1.2);

  rotateX(-QUARTER_PI / 2);
  rotateY(QUARTER_PI);

  noStroke();
  directionalLight(255, 165, 0, 0, 1, 0);
  directionalLight(154, 98, 38, 1, 0, 0);
  directionalLight(170, 170, 170, 0, 0, -1);

  int maxH = 100;
  int size = 20;
  int boxSize = 10;
  float xoff = 0;
  float yoff = 0;

  for (int i = -size; i <= size; i ++) {
    for (int j = -size; j <= size; j ++) {
      float h = maxH * noise(xoff + counter, yoff) * sin(counter);
      pushMatrix();
      scale(1, 2, 1);
      translate(i * boxSize, h - 4, j * boxSize);
      box(boxSize);
      popMatrix();
      yoff= yoff + 0.03;
    }
    xoff = xoff + 0.03;
    yoff = 0;
  }



  counter = counter + TWO_PI / 600;

/*
  if (counter >= TWO_PI) {
    noLoop();
  } else {
    saveFrame("data/vis006_####.png");
  }
  */
}