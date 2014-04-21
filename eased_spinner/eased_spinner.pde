import org.gicentre.utils.move.Ease;
void setup() {
  size(800,800, P3D);
}

int period = 100;
int counter = 0;

void draw() {
  noStroke();
  background(0);
  fill(255);
  float portion = float(counter)/period;
  counter = (counter + 1) % period;
  ellipse(width/2, height/2, Ease.quinticOut(oscillate(portion)) * 500, 500);

  lights();
  fill(255, 0, 0, 128);
  translate(width/2, width/2, width/2);
  rotate(Ease.quinticBoth(1-portion)*2*PI, 30, 40, 30);
  box(50,80,130);

  fill(0, 0, 255, 128);
  rotate(portion*2*PI, 30, -40, -30);
  box(50,80,130);
}

// takes a number between 0 and 1 representing the portion of the
// way through the sequence, and oscillates between 0 and 1 linearly
float oscillate(float portion) {
  return abs(0.5 - portion) * 2;
}