float xPos;
float yPos;

void setup() {
  size(800,800);
  noStroke();
  frameRate(30);
  
  xPos = width / 2;
  yPos = height / 2;
}

void draw() {
  background(0);
  
  xPos = xPos + (xSpeed * xDirection);
  yPos = yPos + (ySpeed * yDirection);
  
  if (xPos> width) {
    xDirection = xDirection * -1;
    
  }
  
  if (yPos> height) {
    yDirection = yDirection * -1;
  }
  
  ellipse(xPos, yPos, 50, 50);
}
