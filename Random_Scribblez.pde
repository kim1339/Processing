//start by declaring variables
float x;
float y;
float counter;

void setup(){
size(300,300);
//create a white background
background(255);
//starts with a point in the center of the screen
x = width/2;
y = height/2;
counter = 0;
}

void draw(){
  while(counter < 800){
float new_x = constrain(x+random(-20,20),0,width);
float new_y = constrain(y+random(-20,20),0,height);
//stroke color is black
stroke(0);
strokeWeight(4);
line(x,y,new_x,new_y);
x = new_x;
y = new_y;
counter +=1;
}}
