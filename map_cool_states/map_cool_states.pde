import java.util.Map;
PShape usa;
PShape state;

String [] ALL = { "RI", "CT", "MA", "ME", "NH", "VT", "NY", "NJ",
   "FL", "NC", "OH", "IN", "IA", "CO", "NV", "PA", "DE", "MD", "MI",
   "WA", "CA", "OR", "IL", "MN", "WI", "DC", "NM", "VA", "GA", "AL",
   "TN", "WV", "KY", "SC", "WY", "MT", "ID", "TX", "AZ", "UT", "ND", 
   "SD", "NE", "MS", "MO", "AR", "OK", "KS", "LA" };

String [] INGY   = { "MA", "NH", "NY", "NJ",
    "NC", "OH", "CO", "PA", "MI",
   "WA", "CA", "OR", "IL", "MN", "WI", 
   "TN", "KY", "TX", 
   "MO", "LA" };
 
String [] ANDREW = { "MA", "NY",
   "CO", "NV", "PA", "MD", "MI",
   "WA", "CA", "OR", "DC", 
   "WY", "MT", "ID", "UT" };

HashMap<String,Integer> hm = new HashMap<String,Integer>();

void setup() {
  size(950, 600);
  // The file Blank_US_Map.svg can be found at Wikimedia Commons
  usa = loadShape("Blank_US_Map.svg");
  smooth(); // Improves the drawing quality of the SVG
  noLoop();
  for (String s : INGY) {
    hm.put(s, 1);
  }
  for (String s : ANDREW) {
    if(hm.containsKey(s)) {
      hm.put(s, 2);      
    } else {
      hm.put(s, 3);
    }
  }

}

void draw() {
  background(255);
  // Draw the full map
  shape(usa, 0, 0);

  for (String s : ALL) {
    state = usa.getChild(s); 
    state.disableStyle();
    fill(255);
    shape(state, 0, 0);
  }

  color ingy = color(255, 128, 0);
  color andrew = color(0,255,128);
  color ice_cold = color(0,0,255);
  for (Map.Entry e : hm.entrySet()) {
    PShape state = usa.getChild((String)e.getKey());
    // Disable the colors found in the SVG file
    state.disableStyle();
    // Set our own coloring
    color c;
    if ((Integer)e.getValue() == 1) {
      c = ingy;
    } else if ((Integer)e.getValue() == 2) {
      c = ice_cold;
    } else {
      c = andrew;
    }
    fill(c);
    noStroke();
    // Draw a single state
    shape(state, 0, 0);
  }

  IntDict colorMap = new IntDict();
  colorMap.set("Ingy", ingy);
  colorMap.set("Andrew", andrew);
  colorMap.set("Ice Cold!", ice_cold);
  legend(colorMap, 30, height - 125);

  // Save the map as image
  saveFrame("map output.png");
  exit();
}

void legend(IntDict mapping, int x, int y) {
  int current_y = y;
  int block_w = 50;
  int block_h = 30;
  for(String label : mapping.keys()) {
    color c = (color) mapping.get(label);
    fill(c);
    rect(x, current_y, block_w, block_h);
    fill(0);
    text(label, x + block_w + 5, current_y + (2*block_h/3));
    current_y += block_h + 5;
  }

}
 
