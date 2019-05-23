import processing.video.*;
Capture video;
//color is datatype for storing color values
color wantedColor;
float record;
int simX;
int simY;

void setup(){
//screen size
size(320,240);
video = new Capture(this,320,240);
video.start();
//tracking a blue color here
wantedColor = color(0,0,100);
//300 is a random threshold number that will be beaten
}
void captureEvent(Capture video){
  video.read();
}
void draw(){
//loadPixels() will allow us to access pixels[] array
video.loadPixels();
image(video,0,0);
record = 90;
simX = 0;
simY = 0;

//computer vision algorithm that will loop through all the pixels in the image
for (int x = 0; x < video.width; x++){
  for(int y = 0; y < video.height; y++){
    //formula for pixel position within array is:
    int position = x + (y * video.width);
    //gives the RGB value of the pixel in that position
    color currentColor = video.pixels[position];
//RGB values of colored pixels
    float r1 = red(currentColor);
    float g1 = green(currentColor);
    float b1 = blue(currentColor);
    float r2 = red(wantedColor);
    float g2 = green(wantedColor);
    float b2 = blue(wantedColor);
/* you want to find similar pixels so use euclidian distance function
to calculate similarity */
float dist = dist(r1,g1,b1,r2,g2,b2);
if (dist < record){
record = dist;
simX = x;
simY = y;
}
if (record < 5){
  fill(wantedColor);
  ellipse(simX,simY,15,15);
}
}
}
}
void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int position = mouseX + mouseY*video.width;
  wantedColor = video.pixels[position];
}
