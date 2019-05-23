/* This program gives a dotted look to an image
The size of the dots aka ellipses are based on the horizontal location of the mouse
The dots are given the color of their according pixel in the image */

//declaring variable types
PImage pic;
int small_dot, large_dot;
float dot, x, y;
color pixel;

void setup(){
size(200,300);
pic = loadImage("flash.jpg");
pic.resize(width,height);
small_dot = 4;
large_dot = 32;
noStroke();
//white background
background(255);
}

void draw(){
// map() remaps a number from one range to another
/* mouseX value is converted from a value that ranges from 0 to width
to a value that ranges from small_dot to large_dot */
// 0 refers to the left edge of the window, width refers to the right edge
dot = map(mouseX,0,width,small_dot,large_dot);
// random(width) outputs a float but x is 
x = random(width);
y = random(height);
fill(pic.get(int(x),int(y)));
ellipse(x,y,dot,dot);
}
