import org.gicentre.utils.move.Ease;
void setup() {
  size(800,800);
}

int period = 200;
int spin_period = period/2;
int counter = 0;
int circle_dimension = 50;
int num_circles = 8;

void draw() {
  int spacing = width/num_circles;
  noStroke();
  background(0);
  fill(255);
  int offset = 50;
  counter = (counter + 1) % period;
  for (int i = 0; i < num_circles; ++i) {
    for (int j = 0; j < num_circles; ++j) {
      int local_spin_counter = (counter + 5*(num_circles - j)) % spin_period;
      float spin_portion = float(local_spin_counter)/spin_period;

      int local_color_counter = (counter + 5*(num_circles - j)) % period;
      float color_portion = float(local_color_counter)/period;
      if(0.5 - spin_portion < 0) {
        if(0.5 - color_portion < 0) {
          fill(255,0,0);
        } else {
          fill(0,0,255);
        }
      } else {
        if(0.5 - color_portion <= 0) {
          fill(0,0,255);
        } else {
          fill(255,0,0);
        }
      }

      int x = offset + spacing * i;
      int y = offset + spacing * j;
      ellipse(x, y, circle_dimension, Ease.quinticOut(oscillate(spin_portion)) * circle_dimension);
    }
  }

}

// takes a number between 0 and 1 representing the portion of the
// way through the sequence, and oscillates between 0 and 1 linearly
float oscillate(float portion) {
  return abs(0.5 - portion) * 2;
}