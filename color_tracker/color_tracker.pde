// this program finds all similarly-colored pixels in an image

// declaring variable types
PImage img;
color wantedColor;
int similarX;
int similarY;
float dist;
float threshold;

void setup() {
  // sets canvas dimensions as (width, height)
  size(900, 1400);
  
  // replace with your own image; please make sure the image file is in the same folder as your sketch
  img = loadImage("Sharbat_Gula.jpg");
  // width and height are global variables
  img.resize(width, height);
  
  // wantedColor is initially set to a random RGB value
  wantedColor = color(0, 0, 255);
}

void draw(){
  // loads a snapshot of the current display window into the pixels[] array
  img.loadPixels();
  image(img, 0, 0);
  
  // random threshold number
  threshold = 300;
  similarX = 0;
  similarY = 0;
  
  // computer vision algorithm
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      
      int position = x + (y * width);
      color currentColor = img.pixels[position];
      float r1 = red(wantedColor);
      float g1 = green(wantedColor);
      float b1 = blue(wantedColor);
      float r2 = red(currentColor);
      float g2 = green(currentColor);
      float b2 = blue(currentColor);
      
      // calculates difference between the current pixel color and the wanted pixel color
      dist = dist(r1, g1, b1, r2, g2, b2);
      if (dist < threshold){
        threshold = dist;
        similarX = x;
        similarY = y;
      }
      // value of 50 was an arbitrary choice
      if (threshold < 50){
        fill(wantedColor);
        ellipse(similarX, similarY, 30, 30);
      }
    }    
  }
}

void mousePressed() {
   // save the color of the clicked pixel
  int position = mouseX + (mouseY * width);
  wantedColor = img.pixels[position];
}
