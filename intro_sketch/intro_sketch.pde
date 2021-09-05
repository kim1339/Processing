// ellipse(50, 50, 80, 80);

void setup() {
  // sets window size based on (width, height)
  size(1000, 500);
}

void draw() {
  if (mousePressed) {
    // black
    fill(0);
  } else {
    // white
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
