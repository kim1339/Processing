// draw an abstract-looking "bouquet of flowers"

size(1300, 1000);
background(255);
smooth();
stroke(125, 150, 50);
strokeWeight(5);

for (int i = 0; i < 30; i++) {
  float finalX = random(width);
  float finalY = random(height);
  float circleRadius = random(15, 75);
  
  // draw plant stem
  bezier(width/2, height, width/2, random(height), random(width), random(height), finalX, finalY);
  
  // draw flower
  fill(255, 230, 95);
  ellipse(finalX, finalY, circleRadius, circleRadius);
  
  noFill();
}
