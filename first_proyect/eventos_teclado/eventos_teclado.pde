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
}

void mousePressed(){
  posX = posX + 10;
}

void mouseReleased(){
  posX = posX - 10;
}

void mouseMoved() {
  posX = posX + 1;
}

void mouseDragged() {
  posX = mouseX;
  posY = mouseY;
}

void keyPressed() {
  
}

void keyReleased() {}
