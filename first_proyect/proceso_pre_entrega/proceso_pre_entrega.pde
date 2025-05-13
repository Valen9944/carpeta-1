PImage[] escenas;
int escena = 0;
// posicion y tamaño inicial del círculo en la escena 1

float circuloX = 100, circuloY = 400, circuloSize = 50;

// valor de cuanto crece el circulo en escena 3 
float crecimiento = 50;
boolean[] circulosClickeados = new boolean[3];
// saber si los circulos en la escena 9 ya fueron clickeados
int clicksCirculoFinal = 0;
// contador de clicks en la escena 9
boolean mostrarConversacion = false;
// mostrar dialogo en la escena 5

// Variables para doble clic en la escena 8
int lastClickTime = 0;
int clickInterval = 300; // milisegundos

// imagenes por escena 

void setup() {
  size(768, 768);
  escenas = new PImage[11];
  escenas[0] = loadImage("imagen 1.png");
  escenas[1] = loadImage("imagen 2.jpeg");
  escenas[2] = loadImage("imagen 3.png");
  escenas[3] = loadImage("imagen 4.png");
  escenas[4] = loadImage("imagen 5.jpeg");
  escenas[5] = loadImage("imagen 6.png");
  escenas[6] = loadImage("imagen 7.png");
  escenas[7] = loadImage("imagen 8.png");
  escenas[8] = loadImage("imagen 9.png");
  escenas[9] = loadImage("imagen 10.png");
  escenas[10] = loadImage("imagen 11.png");
}

void draw() {
  background(255);
  image(escenas[escena], 0, 0, width, height);

  // Estilo del texto
  textSize(28);
  fill(0);
  textAlign(LEFT, TOP);
  
  // comandos  escena 0

  switch (escena) {
    case 0:
      text("Dale ENTER para empezar", 20, 30);
      break;
      
// escena 1 opcion de circulo o rectangulo

    case 1:
      fill(255, 0, 0);
      ellipse(circuloX, circuloY, 50, 50);
      fill(0, 255, 0);
      rect(width - 150, 400, 100, 50);
      text("Haz clic en el círculo rojo o en el rectángulo verde", 20, 30);
      break;
      
// escena 2 

    case 2:
      text("Haz clic en el lobo", 20, 30);
      break;
// escena 3 comando circulo que crece
    case 3:
      fill(255, 0, 0, 150);
      ellipse(width/2, height/2, crecimiento, crecimiento);
      text("Haz clic en el círculo para escapar", 20, 30);
      break;

// escena 4 

    case 4:
      text("Dale ESPACIO", 20, 30);
      break;

// escena 5 conversacion

    case 5:
      if (!mostrarConversacion) {
        text("Dale a la letra C para ver la conversación", 20, 30);
      } else {
        text("– Abuelita, ¿por qué estás tan rara?\n– Para nada, mijita\nDale ESPACIO", 20, 60);
      }
      break;
      
// escena 6 termina la primera variable

    case 6:
      text("– Para comerte mejor\n\nDale ENTER para empezar de nuevo", 20, 30);
      break;
// escena 7 inicia segunda variable


    case 7:
      text("Dale click a Caperucita", 20, 30);
      break;
      
// escena 8

    case 8:
      text("Doble clic al lobo", 20, 30);
      break;
      
// escena 9 - 3 circulos comando if

    case 9:
      text("Haz clic en los tres círculos", 20, 30);
      for (int i = 0; i < 3; i++) {
        if (!circulosClickeados[i]) {
          fill(0, 0, 255);
          ellipse(100 + i * 150, 700, 50, 50);
        }
      }
      break;

// escena 10 segundo final

    case 10:
      text("¡Y sobrevivieron todos!\nDale ENTER para empezar de nuevo", 20, 30);
      break;
  }
}

// cambios de escena segun el comando 

void keyPressed() {
  if (escena == 0 && key == ENTER) escena = 1;
  else if (escena == 4 && key == ' ') escena = 5;
  else if (escena == 5 && key == 'c') mostrarConversacion = true;
  else if (escena == 5 && key == ' ' && mostrarConversacion) escena = 6;
  else if ((escena == 6 || escena == 10) && key == ENTER) {
    
    // reiniciar valores para volver a empezar
    
    escena = 0;
    mostrarConversacion = false;
    crecimiento = 50;
    circulosClickeados = new boolean[3];
    clicksCirculoFinal = 0;
  }
}

// interacciones con el mouse

void mouseClicked() {
  if (escena == 1 && dist(mouseX, mouseY, circuloX, circuloY) < 25) {
    escena = 2;
  } else if (escena == 1 && mouseX > width - 150 && mouseX < width - 50 && mouseY > 400 && mouseY < 450) {
    escena = 7;
  } else if (escena == 2 && mouseX > 500 && mouseY > 300) {
    escena = 3;
  } else if (escena == 3 && dist(mouseX, mouseY, width/2, height/2) < crecimiento/2) {
    crecimiento += 50;
    if (crecimiento > width * 1.5) escena = 4;
  } else if (escena == 7 && mouseX > 300 && mouseX < 500 && mouseY > 500) {
    escena = 8;
  } else if (escena == 9) {
    for (int i = 0; i < 3; i++) {
      float x = 100 + i * 150;
      if (!circulosClickeados[i] && dist(mouseX, mouseY, x, 700) < 25) {
        circulosClickeados[i] = true;
        clicksCirculoFinal++;
        if (clicksCirculoFinal >= 3) escena = 10;
      }
    }
  }
}

// doble click para escena 8 a 9

void mousePressed() {
  if (escena == 8 && mouseX > 400 && mouseY < 400) {
    int currentTime = millis();
    if (currentTime - lastClickTime < clickInterval) {
      escena = 9;
    }
    lastClickTime = currentTime;
  }
}
