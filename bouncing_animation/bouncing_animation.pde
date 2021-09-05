// 2D animation of bouncing ball

PVector position;
PVector velocity;
// object accelerates in the y-direction due to gravity
PVector acceleration;

void setup() {
  size(1400, 800);
  // black background & white stroke
  background(0);
  stroke(255);
  strokeWeight(1);
  
  position = new PVector(80, 80);
  velocity = new PVector(1.0, 1.4);
  acceleration = new PVector(0, .2);
}

void draw() {
  // vector addition of velocity to position & acceleration to velocity
  position.add(velocity);
  velocity.add(acceleration);
  
  // setting boundaries at the edges of screen
  if (position.x > width || position.x < 0){
    velocity.x = velocity.x * -1;
  }
  if (position.y > height){
    velocity.y = velocity.y * -.9;
    position.y = height;
  }
  
  ellipse(position.x, position.y, 80, 80);
  fill(100, 20, 120);
}
