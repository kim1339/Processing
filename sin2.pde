//SIN WAVE
int x_spacing = 5;   // spacing b/w each ellipse
int w;              // width of entire wave

float theta = 0.0; 
float amplitude = 50.0;
float period = 250.0; 
float increment_x;
float[] y_values;  // array that stores height values of the wave

void setup() {
  size(600, 300);
  w = width+5;
  increment_x = (TWO_PI / period) * x_spacing;
  y_values = new float[w/x_spacing];
}

void draw() {
  background(0);
  calcWave();
  renderWave();
}

void calcWave() {
  theta += 0.02;

  // for every x value, calculate a y value output
  float x = theta;
  for (int i = 0; i < y_values.length; i++) {
    y_values[i] = amplitude * sin(x);
    x += increment_x;
  }
}

void renderWave() {
  fill(255);
  for (int x = 0; x < y_values.length; x++) {
    ellipse(x*x_spacing, height/2 + y_values[x], 5, 5);
  }
}
