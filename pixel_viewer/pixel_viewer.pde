PImage img;

void setup() {
  // change the window size/proportion depending on your image
  size(1200, 900);
  
  // you can either upload an image file to your sketch folder, or give the image URL
  img = loadImage("https://theplaidhorse.s3.amazonaws.com/media/uploads/2020/08/AdobeStock_326500445-1-scaled.jpeg");
  img.resize(width, height);
}

void draw() {
  image(img, 0, 0);

  // get the color at the mouse position
  color c = img.get(mouseX, mouseY);

  // change the fill to that color
  fill(c);

  // draw a rectangle with that color
  rect(mouseX, mouseY, 70, 70);
}
