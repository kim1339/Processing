// colors of the rainbow (arbitrarily used hex color codes here)

color red = #FF0000;
color orange = #FF7F00;
color yellow = #FFFF00;
color green = #00FF00;
color blue = #0000FF;
color indigo = #2E2B5F;
color violet = #8B00FF;

color[] colors  = {red, orange, yellow, green, blue, violet, indigo};

void setup() {
  size(900, 900);
  float x = width/2;
  float y = height - 50;
  float ellipse_size = width/2;
  PImage bg_img = loadImage("sky_bg.jpg");
  image(bg_img, 0, 0, width, height);
  strokeWeight(30);
  noFill();
  
  // use a for-each loop to paint the arcs of the rainbow
  for (color c: colors) {
    stroke(c);
    arc(x, y, ellipse_size, ellipse_size, -PI, 0);
    ellipse_size -= 50;
  }
}
