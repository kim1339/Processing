// rainfall simulation used to teach OOP concepts

int numDrops = 14;
Rain[] drops = new Rain[numDrops]; // declare and create the array

void setup() {
  size(1200, 1200);
  background(255);
  smooth();
  noStroke();
  // loop through array to create each raindrop object
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Rain(); // create each object
  }
}

void draw(){
  fill(255, 80);
  rect(0, 0, width, height);
  // loop through array to use objects.
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }
}

// user-defined class
class Rain {
  float x = random(width);
  float y = random(-height);

  void fall() {
    y = y + 7;
    fill(10, 100, 250, 180);
    ellipse(x, y, 40, 40);

   // if raindrop falls out of bounds, reset its position
   if (y > height) {
   x = random(width);
   y = random(-200);
   }
  }
}
