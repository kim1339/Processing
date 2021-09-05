// this program gives a dotted look to an image
// the size of the dots (ellipses) are based on the horizontal location of the mouse
// the colors of the dots are based on the colors of corresponding pixels in the image

//declaring variable types
PImage pic;
int small_dot, large_dot;
float dot, x, y;
color pixel;

void setup() {
  size(1100, 1000);
  pic = loadImage("emerald_lake.jpg");
  pic.resize(width, height);
  
  // arbitrary min and max dot sizes
  small_dot = 12;
  large_dot = 52;
  
  noStroke();
  //white background
  background(255);
}

void draw() {
  // map() remaps a number from one range to another
  // mouseX value is converted from a value that ranges from 0 to width, to a value that ranges from small_dot to large_dot
  // 0 refers to the left edge of the window, width refers to the right edge
  
  dot = map(mouseX, 0, width, small_dot, large_dot);
  x = random(width);
  y = random(height);
  fill(pic.get(int(x), int(y)));
  ellipse(x, y, dot, dot);
}
