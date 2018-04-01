OpenSimplexNoise noise;

void setup() {
  size(500, 500);
  background(0);
  stroke(255);
  noFill();

  noise = new OpenSimplexNoise();
}

int numFrames = 75;

float radius = 1.5;

void draw() {
  float t = 1.0*frameCount/numFrames;

  background(0);
  float scale = 0.02;

  loadPixels();
  for (int x = 0; x<width; x++) {
    for (int y = 0; y<height; y++) {
      float ns = (float)noise.eval(scale*x, scale*y, radius*cos(TWO_PI*t), radius*sin(TWO_PI*t));
      float col = map(ns, -1, 1, 0, 255);
      pixels[x + width*y] = color(col);
    }
  }
  updatePixels();

}