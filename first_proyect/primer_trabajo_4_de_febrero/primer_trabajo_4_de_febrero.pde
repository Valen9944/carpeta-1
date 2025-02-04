int unitSize = 50; 
int horizontalCenter;
int verticalCenter;

void setup() {
  
  size(600, 600);
  background(255);
  
  horizontalCenter = width/ 2;
  verticalCenter = height / 2;
  
  translate(horizontalCenter, verticalCenter);
  drawAxes();
}
 
void drawAxes() {

  stroke(0);

  strokeWeight(2);

  line(0, -height / 2, 0, height / 2); // Y-axis

  line(-width / 2, 0, width / 2, 0); // X-axis

  

  fill(0);

  textSize(12);

  textAlign(CENTER, CENTER);

  

  for (int x = 0; x < width / 2; x += unitSize) {

    int value = x / unitSize;

    text(value, x, 12);

    text(-value, -x, 12);

  }

  

  for (int y = 0; y < height / 2; y += unitSize) {

    int value = -y / unitSize;

    text(value, 12, y);

    text(-value, 12, -y);

  }

}
