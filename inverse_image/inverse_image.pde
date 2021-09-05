PImage img;

void setup() {
  // change the window size/proportion depending on your image
  size(1000, 700);
  
  // you can either upload an image file to your sketch folder, or give the image URL
  img = loadImage("https://theplaidhorse.s3.amazonaws.com/media/uploads/2020/08/AdobeStock_326500445-1-scaled.jpeg");
  img.resize(width, height);

  // loop over every pixel in the image
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      // read the pixel's color
      color in = img.get(x, y);
      
      // inverse the color
      color out = color(255 - red(in), 255 - green(in), 255 - blue(in));
      
      // set the pixel's color
      img.set(x, y, out);
    }
  }
}

void draw() {
  image(img, 0, 0);
}
