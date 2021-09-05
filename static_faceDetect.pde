import processing.video.*;

// this library contains graphics & shapes
import java.awt.Rectangle;

// opencv is a computer vision library
import gab.opencv.*;

// declare variable types
PImage pic;
OpenCV opencv;
Rectangle[] faces;
Rectangle[] eyes;
color c;
float r, g, b;
boolean pressed;

void setup(){
opencv = new OpenCV(this, "afghan.jpg");
size(200, 300);

opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
opencv.loadCascade(OpenCV.CASCADE_EYE);
faces = opencv.detect();
eyes = opencv.detect();
pic = loadImage("afghan.jpg");
pic.loadPixels();

}

void draw(){
  image(opencv.getInput(), 0, 0);
  noFill();
  // green
  stroke(0, 255, 0);
  strokeWeight(3);
  // display rectangles around all detected faces
  for (int i = 0; i < faces.length; i++){
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
  stroke(0, 0, 255);
  strokeWeight(2);
  for(int i = 0; i < eyes.length; i++){
    rect(eyes[i].x, eyes[i].y, eyes[i].width, eyes[i].height);

  }
   c = get(mouseX,mouseY);
   r = red(c);
   g = green(c);
   b = blue(c);
   print(r,g,b);
  
printArray(faces);
printArray(eyes);
if (pressed){
  text("X: " + mouseX + "  Y: " + mouseY,10,15);
}
}

void mousePressed(){
  pressed = true;
}
