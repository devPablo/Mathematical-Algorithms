import peasy.*;

float x = 0;
float y = 0;
float a = 0;
float r = 0;
float hue = 0;

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam camera;

void setup() {
  size(600, 600, P3D);
  colorMode(HSB);
  camera = new PeasyCam(this, 0, -50, 0, 1200);
  camera.setYawRotationMode();
}

void draw() {
  background(0);
  hue = 0;

  translate(0, 0, 0);
  rotateZ(PI/2);
  rotateY(PI*2);
  scale(85);

  if (a < PI*2+0.1) {
    r = 2 + 2 * cos(a);
    x = r * cos(a);
    y = r * sin(a);
    points.add(new PVector(x, y));
  }

  beginShape();
  for (PVector v : points) {
    strokeWeight(0.1);
    stroke(hue, 200, 255);
    noFill();
    vertex(v.x, v.y);

    hue += 2.5;
    if (hue > 255) {
      hue = 0;
    }
    a += 0.001;
  }
  endShape();
  camera.rotateY(0.035);
}
