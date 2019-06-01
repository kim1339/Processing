//animation of bouncing object

PVector position;
PVector velocity;
//object accelerates in the y-direction due to gravity
PVector acceleration;

void setup(){
  
size(700,400);
//black background & white stroke color
background(0);


position = new PVector(80,80);
velocity = new PVector(1.0,1.4);
acceleration = new PVector(0,.2);

}

void draw(){
// vector addition of velocity to position & acceleration to velocity
  position.add(velocity);
  velocity.add(acceleration);
  
//setting boundaries at the edges of screen
if (position.x > width || position.x < 0){
  velocity.x = velocity.x * -1;
}
if (position.y > height){
  velocity.y = velocity.y * -.9;
  position.y = height;
}
stroke(255);
strokeWeight(1);
fill(100,20,120);
ellipse(position.x,position.y,40,40);
}
