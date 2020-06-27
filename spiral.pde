//creating a spiral

float radius = 0;
float angle = 0;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
 
  // Polar to Cartesian conversion
  // cos is adj/hyp
  float x = radius * cos(angle);
  // sin is opp/hyp
  float y = radius * sin(angle);
  
//using ellipses to draw the spiral
  noStroke();
  fill(random(255),random(40), random(150));
  // adjust x,y coordinates to start spiral at the center of the window
  ellipse(x+ (width/2), y+ (height/2), 10, 10); 

  // increment the angle
  angle += 1;
  // increment the radius
  radius += 0.1;
  }
