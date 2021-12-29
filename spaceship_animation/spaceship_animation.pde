// Rocketship game: 
// - You can control the spaceship using arrowkeys and activate super speed mode using the spacebar.
// - Avoid colliding with meteors. If the rocket hits a meteor, it's game over :(

// arbitrary choice for # of stars
float[] stars_x = new float[100];
float[] stars_y = new float[100];
float[] stars_speed = new float[100];

// arbitrary choice for # of meteors
float[] meteors_x = new float[5];
float[] meteors_y = new float[5];
float[] meteor_sizes = new float[5];
float meteor_speed = 5;

PImage rocket_img, meteor_img;
float rocketX = 0;
float rocketY = height/2;
float rocket_width = 220;
float rocket_height = 120;
String rocket_image_file = "rocketship.png"; // don't forget to include the file extension (ex: ".png")
float  rocket_speed = 10;

void setup() {
  size(1500, 1200);
  background(0);
  stroke(255);
  noCursor();
  
  rocket_img = loadImage(rocket_image_file);
  meteor_img = loadImage("meteor.png");
  
  for (int i = 0; i < stars_x.length; i++) {
    stars_x[i] = random(0, width);
    stars_y[i] = random(0, height);
    stars_speed[i] = random(1, 12);
  }
  
  for (int i = 0; i < meteors_x.length; i++) {
    meteors_x[i] = random(3 * width/4, width);
    meteors_y[i] = random(0, height);
    meteor_sizes[i] = random(50, 250);
  }
}

void draw() {
  background(0);
  
  image(rocket_img, rocketX, rocketY, rocket_width, rocket_height);
  
  for (int i = 0; i < stars_x.length; i++) {
    // the faster stars are brighter (whiter) in colour to create the illusion that the rocketship is moving through space
    float colour = map(stars_speed[i], 1, 12, 100, 255);
    stroke(colour);
    strokeWeight(stars_speed[i]);
    point(stars_x[i], stars_y[i]);
  
    stars_x[i] = stars_x[i] - stars_speed[i] / 2;
    
    // reset the position of the stars and rocketship if they reach the edges of the screen
    if (stars_x[i] < 0) {
      stars_x[i] = width;
    }
    if (rocketX > width) {
      rocketX = 0;
    }
    if (rocketY > height) {
      rocketY = 0;
    }
    if (rocketY < 0) {
      rocketY = height;
    }
  }
  
  for (int i = 0; i < meteors_x.length; i++) {
    image(meteor_img, meteors_x[i], meteors_y[i], meteor_sizes[i], meteor_sizes[i]);
    meteors_x[i] -=  meteor_speed;
    if (meteors_x[i] < 0) {
      meteors_x[i] = width;
      meteors_y[i] = random(0, height);
    }
    if (checkCollision(meteors_x[i], meteors_y[i], meteor_sizes[i])) {
      println("GAME OVER");
      delay(2000);
      exit();
      }
    }
  }

void keyPressed() {
  if (keyCode == UP) {
    rocketY -= rocket_speed; 
  } 
  else if (keyCode == DOWN) {
    rocketY += rocket_speed;
  } 
  else if (keyCode == RIGHT) {
    rocketX += rocket_speed;
  }
  // press the spacebar to activate super speed mode
  else if (key == ' ') {
    rocket_image_file = "rocketship_flame.PNG";
    rocket_img = loadImage(rocket_image_file);
    rocket_speed = 20;
  }
}

// Collision Detection:
// Even though the rocketship and meteor are not actually rectangles, a common technique in video games is to use an invisible rectangle ("bounding box") to represent your object anyway.
  
boolean checkCollision(float meteor_x, float meteor_y, float meteor_size) {
  // rectOne => rocketship
  float rectOneRight = rocketX + rocket_width;
  float rectOneLeft = rocketX;
  float rectOneBottom = rocketY + rocket_height;
  float rectOneTop = rocketY;
  
  // rectTwo => meteor
  float rectTwoRight = meteor_x + meteor_size;
  float rectTwoLeft = meteor_x;
  float rectTwoBottom = meteor_y + meteor_size;
  float rectTwoTop = meteor_y;
  
  // evaluates to true if the rocketship and meteor are colliding
  return (rectOneRight > rectTwoLeft && rectOneLeft < rectTwoRight && rectOneBottom > rectTwoTop && rectOneTop < rectTwoBottom);
}
