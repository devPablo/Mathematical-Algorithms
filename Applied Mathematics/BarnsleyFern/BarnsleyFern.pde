float x = 0;
float y = 0;
float hue = 0;

void setup() {
  size(600, 600);
  colorMode(HSB);
  background(0);
}

void draw() {  
  hue = 0;
  strokeWeight(1);

  for (int i = 0; i < 1000; i++) {
    nextPoint();
    float px = map(x, -2.1820, 2.6558, 0, width);
    float py = map(y, 0, 9.9983, height, 0);
    hue = map(px, 0, 650, 0, 255);
    stroke(hue, 155, 255);
    point(px, py);
  }
}

void nextPoint() { 
  float nextX, nextY;
  float p = random(1);

  if (p < 0.02) {
    nextX =  0;
    nextY =  0.16 * y;
  } else if (p < 0.85) {
    nextX =  0.85 * x + 0.04 * y;
    nextY = -0.04 * x + 0.85 * y + 1.60;
  } else if (p < 0.93) {
    nextX =  0.20 * x - 0.26 * y;
    nextY =  0.23 * x + 0.22 * y + 1.60;
  } else {
    nextX = -0.15 * x + 0.28 * y;
    nextY =  0.26 * x + 0.24 * y + 0.44;
  }

  x = nextX;
  y = nextY;
}
