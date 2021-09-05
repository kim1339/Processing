// this sketch generates random scribbles

float x, y;

void setup(){
  size(800, 800);
  // create a white background
  background(255);
  
  // starts with a point in the center of the screen
  x = width / 2;
  y = height / 2;
}

void draw(){
  float new_x = constrain(x + random(-300, 300), 0, width);
  float new_y = constrain(y + random(-300, 300), 0, height);

  stroke(random(0, 255), random(0, 255), random(0, 255));
  strokeWeight(random(10, 40));
  line(x, y, new_x, new_y); 
  x = new_x;
  y = new_y;
  delay(250); // delays program for 1/4 of a second
}

// stop program when mouse pressed
void mousePressed() {
  stop(); 
}
