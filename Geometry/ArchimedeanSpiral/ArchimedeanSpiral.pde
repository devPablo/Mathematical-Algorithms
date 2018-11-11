import peasy.*;

float x = 0;
float y = 0;
float z = 0;
float a = 0;
float r = 0;
float hue = 0;

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam camera;

void setup() {
  size(800, 800, P3D);
  colorMode(HSB);
  camera = new PeasyCam(this, 0, -50, 0, 1200);
  camera.setYawRotationMode();
} 

void draw() {
  background(0);
  translate(0, 0, 0);
  rotateX(PI);
  rotateY(PI);
  scale(0.4);
  hue = 0;

  a += 0.1;
  r += 5;

  x = r * cos(a);
  y = r * sin(a);
  z += 5;



  if (a < TWO_PI*10) {
    points.add(new PVector(x, y, z));
  }

  camera.lookAt(points.get(0).x, points.get(0).y, 0); 
  strokeWeight(5);
  noFill(); 

  beginShape();
  for (PVector v : points) {
    stroke(hue, 255, 255);
    vertex(v.x, -v.y, v.z);

    hue += 1;
    if (hue > 255) {
      hue = 0;
    }
  }
  endShape();

  camera.rotateY(-0.01);
}
