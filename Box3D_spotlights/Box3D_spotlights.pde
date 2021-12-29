// display a box with 3 different kinds of lights
// have your student run the program and play around with it!

void setup() {
  size(640, 360, P3D);
  noStroke();
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  
  // orange point light from the right
  pointLight(150, 100, 0, // color
             200, -150, 0); // position

  // blue directional light from the left
  directionalLight(0, 102, 255, // color
                   1, 0, 0); // the x-, y-, z-axis direction

  // yellow spotlight from the front
  spotLight(255, 255, 109, // color
            0, 40, 200, // position
            0, -0.5, -0.5, // direction
            PI / 2, 2); // angle, concentration
  
  rotateY(map(mouseX, 0, width, 0, PI));
  rotateX(map(mouseY, 0, height, 0, PI));
  box(150);
}
