//declaring variable types
PImage img;
float record;
color wantedColor;
int similarX;
int similarY;
float dist;

void setup(){
//sets canvas dimensions
size(400,600);
img = loadImage("Sharbat_Gula.jpg");
//width and height are global variables
img.resize(width,height);
//wantedColor is set to an initial random RGB value
wantedColor = color(0,0,255);
}

void draw(){
//loads a snapshot of the current display window into the pixels[] array
img.loadPixels();
image(img,0,0);
//random threshold number
record = 300;
similarX = 0;
similarY = 0;
//computer vision algorithm
for(int x = 0; x < 400; x++){
  for(int y = 0; y < 600; y++){
    
    int position = x + (y*width);
    color currentColor = img.pixels[position];
    float r1 = red(wantedColor);
    float g1 = green(wantedColor);
    float b1 = blue(wantedColor);
    float r2 = red(currentColor);
    float g2 = green(currentColor);
    float b2 = blue(currentColor);
    //calculates difference between the current pixel color and the wanted pixel color
    dist = dist(r1,g1,b1,r2,g2,b2);
    if (dist < record){
      record = dist;
      similarX = x;
      similarY = y;
    }
    if (record<15){
      fill(wantedColor);
      ellipse(similarX,similarY,20,20);
    }
  }    
}
}
void mousePressed() {
   //Save color where the mouse is clicked in trackColor variable
  int position = mouseX + mouseY*width;
  wantedColor = img.pixels[position];
}
