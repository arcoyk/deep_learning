String[] lines;

void setup() {
  size(500, 500);
  proc();
}

void draw() {
}

float max_input = 0;
float min_input = 100000;
int y_offset = 0;
int x_offset = 0;
void proc() {
  lines = loadStrings("dae.csv");
  y_offset = height / lines.length;
  for (int y = 0; y < lines.length; y++) {
    String line = lines[y];
    String[] vals = line.split(",");
    x_offset = width / vals.length;
    for (int x = 0; x < vals.length; x++) {
      float input = Float.parseFloat(vals[x].trim());
      rect(x_offset * x, y_offset * y, x_offset, y_offset);
      max_input = get_max(max_input, input);
      min_input = get_min(min_input, input);
    }
  }
  
  for (int y = 0; y < lines.length; y++) {
    String line = lines[y];
    String[] vals = line.split(",");
    for (int x = 0; x < vals.length; x++) {
      float input = Float.parseFloat(vals[x].trim());
      fill(map(input, min_input, max_input / 20, 0, 255));
      rect(x_offset * x, y_offset * y, x_offset, y_offset);
      fill(map(input, min_input, max_input / 20, 255, 0));
      text(input, x_offset * x, y_offset * y + 20);
    }
  }
}

float get_max(float crr, float val) {
  return val > crr ? val : crr;
}

float get_min(float crr, float val) {
  return val < crr ? val : crr;
}


