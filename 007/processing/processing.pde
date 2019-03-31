float counter = 0;
int radius = 200;
int sectionRadius = 100;


void setup() {
  size(720, 720, P3D);
  frameRate(24);
}

void draw() {
  background(0);
  translate(width / 2, -30 + height / 2, 0);
  rotateX(-atan(.6));

  stroke(0);
  rotateY(counter);


  for (float c = 0; c < 2 * PI; c = c + (2 * PI / 100)) {
    float x = radius * sin(c);
    float z = radius * cos(c);

    for (float b = 0; b < 2 * PI; b = b + (2 * PI / 50)) {

      float offset = 8 * sin((b + c + counter)* 6);

      float j = (sectionRadius + offset) * sin(b); 
      float k = (sectionRadius + offset) * cos(b); 

      pushMatrix(); 
      translate(x, 0, z); 
      rotateY(c); 
      translate(0, j, k); 
      rotateX(-b);
      scale(abs(cos(counter + offset / 20)));
      fill(255);
      box(14); 
      popMatrix();
    }
  }
  counter = counter - (PI / 360);

  /*
  if (counter > -PI) {
   saveFrame("output/vis007_####.png");
   } else {
   noLoop();
   }
   */
};
