int [] xPositions;

void setup() {
  size (800,800);
  background(0);
  noStroke();
  
  
  xPositions = new int[10];
  for (int i = 0; i < xPositions. length; i++) {
    xPositions [i] = 50  * i + 20;
    println(xPositions[i]);
  }
}

void draw () {
  for (int i = 0; i < xPositions. length; i ++) {
    ellipse(10 , 20, 50, 50);
  }
}
  
  
 
