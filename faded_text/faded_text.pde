// program that lets you type big, randomly-placed letters that fade out

// feel free to customize the colours (ie. change the hex colour codes) and other details

void setup() {
  size(1200, 1200);
  background(#12dbff);
}

void draw() {
  fill(#12dbff, 8);
  rect(0, 0, width, height);
}

void keyPressed() {
  fill(0);
  textSize(random(60, 600));
  text(key, 
  random(900),        // randomize x-position of text
  random(300, 1200)); // randomize y-position of text
}
