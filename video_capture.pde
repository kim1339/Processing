import processing.video.*;
Capture video;

void setup(){
size(320,240);
video = new Capture(this,320,240);
video.start();
}
//captureEvent() means whenever a new frame is available from the camera
void captureEvent(Capture video){
video.read();
}

void draw(){
image(video,0,0);
}
