PImage[] escenas = new PImage[7];
int estado = 0;
float circuloX = 50;
float circuloY;
float diametro = 50;
boolean creciendo = false;
float circuloCreciente = 50;

void setup() {
  size(800, 600);
  escenas[0] = loadImage("imagen 1.png");
  escenas[1] = loadImage("imagen 2.jpeg");
  escenas[2] = loadImage("imagen 3.png");
  escenas[3] = loadImage("imagen 4.png");
  escenas[4] = loadImage("imagen 5.jpeg");
  escenas[5] = loadImage("imagen 6.png");
  escenas[6] = loadImage("imagen 7.png");
  circuloY = height / 2;
}

void draw() {
  background(255);
  
  switch(estado) {
    case 0:
      image(escenas[0], 0, 0, width, height);
      fill(0);
      textSize(32);
      text("Dale ENTER para empezar", 200, 550);
      break;
      
    case 1:
      image(escenas[1], 0, 0, width, height);
      fill(255, 0, 0);
      ellipse(circuloX, circuloY, diametro, diametro);
      circuloX += 2;
      if (circuloX > width) circuloX = 0;
      break;
      
    case 2:
      image(escenas[2], 0, 0, width, height);
      fill(255);
      textSize(32);
      text("Haz CLICK en el lobo", 200, 550);
      break;
      
    case 3:
      image(escenas[3], 0, 0, width, height);
      fill(255, 0, 0);
      ellipse(width/2, height/2, circuloCreciente, circuloCreciente);
      break;
      
    case 4:
      image(escenas[4], 0, 0, width, height);
      fill(255);
      textSize(32);
      text("Presiona ESPACIO para continuar", 150, 550);
      break;
      
    case 5:
      image(escenas[5], 0, 0, width, height);
      fill(255);
      textSize(24);
      text("Presiona la letra C para ver la conversación", 100, 550);
      break;
      
    case 6:
      image(escenas[5], 0, 0, width, height);
      fill(255);
      textSize(24);
      text("Abuelita, ¿por qué estás tan rara?", 100, 500);
      text("Para nada mijita...", 100, 530);
      text("Presiona ESPACIO", 100, 560);
      break;
      
    case 7:
      image(escenas[6], 0, 0, width, height);
      fill(255, 0, 0);
      textSize(32);
      text("¡PARA COMERTE MEJOR!", 200, 500);
      text("Presiona ENTER para volver a empezar", 100, 550);
      break;
  }
}

void keyPressed() {
  if (estado == 0 && key == ENTER) {
    estado = 1;
  } else if (estado == 4 && key == ' ') {
    estado = 5;
  } else if (estado == 5 && key == 'c') {
    estado = 6;
  } else if (estado == 6 && key == ' ') {
    estado = 7;
  } else if (estado == 7 && key == ENTER) {
    estado = 0;
  }
}

void mousePressed() {
  if (estado == 1) {
    float d = dist(mouseX, mouseY, circuloX, circuloY);
    if (d < diametro / 2) {
      estado = 2;
    }
  } else if (estado == 2) {
    estado = 3;
  } else if (estado == 3) {
    float d = dist(mouseX, mouseY, width/2, height/2);
    if (d < circuloCreciente / 2) {
      circuloCreciente += 20;
      if (circuloCreciente > width * 1.5) {
        estado = 4;
        circuloCreciente = 50;
      }
    }
  }
}
