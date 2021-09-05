// TODO: for raindrop pitter patter sound effect
import processing.sound.*;

PImage raindrop;
SoundFile file;
int numDrops = 14;
// declare and create the array
Rain[] drops = new Rain[numDrops]; 

void setup() {
  size(1200, 1200);
  raindrop = loadImage("raindrop.png");
  file = new SoundFile(this, "");
  
  // loop through array to create each raindrop object
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Rain();
  }
}

void draw(){
  fill(218, 240, 247);
  rect(0, 0, width, height);
  // loop through array to use objects.
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }
}

// user-defined class
class Rain {
  // properties
  float x = random(width);
  float y = random(-height);
  
  void fall() {
    y = y + 7;
    image(raindrop, x, y);

   // if raindrop falls out of bounds, reset its position
   if (y > height) {
   // play sound effect
   x = random(width);
   y = random(-200);
   }
  }
}
