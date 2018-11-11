import peasy.*;

float x = 0.01;
float y = 0;
float z = 0;
float hue = 0;

ArrayList<PVector> points = new ArrayList<PVector>();

final float RHO = 28;
final float SIGMA = 10;
final float BETA = 8/3;
final float CHANGE_IN_TIME = 0.01;

PeasyCam camera;

void setup() {
	size(600, 600, P3D);
	colorMode(HSB);
	camera = new PeasyCam(this, 0, -50, 0, 800);
	camera.setYawRotationMode();
}

void draw() {
  background(0);
	
  x += changeInX();
  y += changeInY();
  z += changeInZ();

  points.add(new PVector(x, y, z));

  translate(0, 250, 0);
  rotateX(-PI/3);
  rotateY(PI);
  scale(8);
  noFill();
  hue = 0;
  camera.lookAt(points.get(0).x, points.get(0).y, 0);	

  beginShape();
  for (PVector v : points) {
    strokeWeight(0.25);
    stroke(hue, 255, 255);
    vertex(v.x, v.y, v.z);
    hue += 0.25;
	
    if (hue > 255) {
      hue = 0;
    }
  }
  endShape();
  camera.rotateY(-0.01);
}

float changeInX() {
  float dx = (SIGMA * (y - x)) * CHANGE_IN_TIME;
  return dx;
}

float changeInY() {
  float dy = (x * (RHO - z) - y) * CHANGE_IN_TIME;
  return dy;
}

float changeInZ() {
  float dz = (x * y - BETA * z) * CHANGE_IN_TIME;
  return dz;
}
