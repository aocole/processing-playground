int dimension = 16;
int circle_size = 25;
int tolerance = 25;
int offset = circle_size;
boolean[][] found = new boolean[dimension][dimension];
int spacing;

void setup() {
  size(800, 800);
  spacing = width/dimension;

  for(int x = 0; x < dimension; x++) {
    for(int y = 0; y < dimension; y++) {
      found[x][y] = false;
    }
  }

  println(cos(2*PI));
  println(cos(180));

}

boolean logged = false;
float color_offset = 0;
  
void draw() {
  background(0);
  for(int x = 0; x < dimension; x++) {
    for(int y = 0; y < dimension; y++) {
      if(found[x][y]) {
        stroke(0);
        float percentage_across = (float(x+y)/2) / (dimension - 1);
        float place = (float(x+y)/2) / (dimension - 1) * PI + color_offset;
        float r = abs(cos(place         )) * 255;
        float g = abs(cos(place + PI*1/3)) * 255;
        float b = abs(cos(place + PI*2/3)) * 255;
        fill(r, g, b);
        if (!logged) {
          println(place, r, g, b);
        }
        ellipse(x*spacing + offset, y*spacing + offset, circle_size, circle_size);
      }
    }
  }
  color_offset = (color_offset + 0.05) % PI;
  logged = true;
  stroke(255);
  fill(255);
  ellipse(mouseX, mouseY, circle_size, circle_size);

  if ((mouseX - offset) % spacing < tolerance && (mouseY - offset) % spacing < tolerance) {
    found[mouseX/spacing][mouseY/spacing] = true;
  }
}

