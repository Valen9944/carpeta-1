void setup() {
  size(800, 800);
  background(0);
}

void draw() {
 fill(255);
  // for loop
  for (int i = 0; i < width; i=i + 10) {
    for(int j = 0; j < height; j=j+10){
       fill(255);
    quad(i, j, i+20, j, i +40, j+20, i+20, j+20);
    }
    i=i+60;
  }
}
