// variable "a" represents a constant
float a = 0;

void setup() {
  size(1500, 900);
  background(255);
  colorMode(HSB, 100);
  noStroke();
}

void draw() {
  // map() re-maps a number from one range to another
  
  float x = map(sin(a) * sin(a * 0.8), -1, 1, 0, width);
  float y = map(sin(a * 1.1 + 1.5) * sin(a * 3.1), -1, 1, 0, height);
  float colour = map(sin(a * 0.03), -1, 1, 0, 100);
  float size = map(sin(a * 2) * sin(a * 2.5), -1, 1, 10, 40);
  float brightness = map(sin(a * 1.3) * sin(a * 4.1), -1, 1, 10, 60);

  fill(colour, 50, brightness);
  ellipse(x, y, size, size);

  a += 0.03;
}
