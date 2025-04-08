int posX;
int posY;

void setup() {
  size(1000, 800);
  background(255);
  
  posX = width/2;
  posY = height/2;
}

void draw() {
  background(255);
  ellipse(posX, posY, 50, 50);
  
  if (keyPressed == true) {
    if (key == ' ') {
      background(0);
    }
    
    if (keyCode == UP) {
      posY = posY - 5;
    }
    if (keyCode == DOWN) {
      posY = posY + 5;
    }
    if (keyCode == LEFT) {
      posX = posX - 5;
    }
    if (keyCode == RIGHT) {
      posX = posX + 5;
    }
  }
}
  
