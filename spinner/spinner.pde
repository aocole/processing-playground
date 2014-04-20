void setup() {
  size(800,800);
}

int spin_counter = 0;
int spin_period = 200;
int spin2_counter = 0;
int spin2_period = 150;
int color_counter = 0;
int color_period = 400;
int circle_dimension = 50;
int num_circles;

void draw() {
  background(0);
  fill(255);
  num_circles = width/circle_dimension;
  for (int i = 0; i < num_circles; ++i) {
    for (int j = 0; j < num_circles; ++j) {
      draw_circle(i, j);
    }
  }
  spin_counter = (spin_counter + 1) % spin_period;
  spin2_counter = (spin2_counter + 1) % spin2_period;
  color_counter = (color_counter + 1) % color_period;
}

void draw_circle(int x, int y) {
  int local_spin_counter = spin_counter + (x + y) * num_circles/2;
  float spin_portion = (float(local_spin_counter)/spin_period);

  int local_spin2_counter = spin2_counter + (num_circles - y) * num_circles;
  float spin2_portion = (float(local_spin2_counter)/spin2_period);

  int local_color_counter = color_counter + (num_circles - x + y) * num_circles/2;
  float color_portion = (float(local_color_counter)/color_period);
  fill(rainbow(color_portion));

  float rad = sin(spin_portion * 2*PI) * circle_dimension;
  float rad2 = sin(spin2_portion * 2*PI) * circle_dimension;
  ellipse(
    x * circle_dimension + (circle_dimension/2), 
    y * circle_dimension + (circle_dimension/2), 
    rad, rad2
  );

}

color rainbow(float fraction) {
  float rad = fraction * PI;
  float r = abs(cos(rad         )) * 255;
  float g = abs(cos(rad + PI*1/3)) * 255;
  float b = abs(cos(rad + PI*2/3)) * 255;
  return color(r, g, b);
}