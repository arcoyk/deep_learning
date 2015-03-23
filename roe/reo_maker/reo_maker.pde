void setup() {
  size(4, 4);
  background(255);
}

String[] lines = new String[50];
int i = 0;
void draw() {
  background(255);
  if (int(random(100)) % 2 == 0) {
    background(0);
    // rect(random(width/2), random(height/2), random(30), random(30));
    // save("/users/kitayui/desktop/roe/" + i + "rect.png");
    lines[i++] = img2serial(1);
  }else {
    // ellipse(random(width/2), random(height/2), random(30), random(30));
    // save("/users/kitayui/desktop/roe/" + i + "elli.png");
    lines[i++] = img2serial(0);
  }
  if ( i == lines.length ) {
    saveStrings(sketchPath("") + "../train.csv", lines);
    saveStrings(sketchPath("") + "../test.csv", lines);
    exit();
  }
}

String img2serial(int id) {
  String str = id + "";
  for(int x = 0; x < width; x++){ 
    for(int y = 0; y < height; y++) {
      str += (int)red(get(x, y));
      if (!(x == width-1 && y == height-1)) {
        str += ",";
      }
    }
  }
  return str;
}

