// this example program is used to teach Object-Oriented Programming concepts

// create empty array
Circle[] circles = new Circle[15];

void setup() {
  size(900, 900);
  for (int i = 0; i < circles.length; i++) {
    // add new instances of the Circle class to the array
    circles[i] = new Circle(random(width), random(height), random(-8, 8), random(-8, 8));
  }
}

void draw() {
  // white canvas background
  background(255);

  for (int i = 0; i < circles.length; i++) {
    circles[i].move();
    circles[i].display();
  }
}

class Circle {
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  color myColor;

  // constructor
  Circle(float x, float y, float xSpeed, float ySpeed) {
    this.x = x;
    this.y = y;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    myColor = color(random(255), random(255), random(255));
  }

  // make sure circles stay within bounds
  void move() {
    x += xSpeed;
    if (x < 0 || x > width) {
      xSpeed *= -1;
    }

    y += ySpeed;
    if (y < 0 || y > height) {
      ySpeed *= -1;
    }
  }

  void display() {
    fill(myColor);
    ellipse(x, y, 80, 80);
  }
}
