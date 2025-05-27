import ddf.minim.*;

PImage[] escenas;
PImage canasta, manzana;
PFont fuenteMedieval;
Minim minim;
AudioPlayer musica;

int escena = 0;
float circuloX = 100, circuloY = 400, circuloSize = 50;
float crecimiento = 50;
boolean[] circulosClickeados = new boolean[3];
int clicksCirculoFinal = 0;
boolean mostrarConversacion = false;
int lastClickTime = 0;
int clickInterval = 300;

void setup() {
  size(768, 768);
  fuenteMedieval = loadFont("AcademyEngravedLetPlain-40.vlw");
  textFont(fuenteMedieval);

  minim = new Minim(this);
  musica = minim.loadFile("midnight-forest-184304.mp3");
  musica.loop();

  escenas = new PImage[11];
  for (int i = 0; i < 11; i++) {
    escenas[i] = loadImage("imagen " + (i+1) + ((i == 1 || i == 4) ? ".jpeg" : ".png"));
  }

  canasta = loadImage("canasta.png");
  manzana = loadImage("manzana.png");
}

void draw() {
  background(0);
  image(escenas[escena], 0, 0, width, height);
  fill(255);
  textFont(fuenteMedieval);

  switch (escena) {
    case 0:
      mostrarTexto("Dale ENTER para empezar", 28, LEFT, TOP, 20, 30);
      break;

    case 1:
      image(canasta, 80, 360, 80, 80);
      image(manzana, width - 150, 360, 80, 80);
      mostrarTexto("Escoge tu camino", 40, CENTER, CENTER, width / 2, height / 2);
      break;

    case 2:
      mostrarTexto("Haz clic en el lobo", 30, LEFT, TOP, 20, 30);
      break;

    case 3:
      fill(255, 0, 0, 150);
      ellipse(width/2, height/2, crecimiento, crecimiento);
      fill(255);
      mostrarTexto("Haz clic en el círculo para escapar", 35, RIGHT, BOTTOM, width - 20, height - 20);
      break;

    case 4:
      mostrarTexto("Dale ESPACIO", 40, CENTER, CENTER, width / 2, height / 2);
      break;

    case 5:
      if (!mostrarConversacion) {
        mostrarTexto("Dale a la letra C para ver la conversación", 38, LEFT, TOP, 20, 30);
      } else {
        mostrarTexto("– Abuelita, ¿por qué estás tan rara?\n– Para nada, mijita\nDale ESPACIO", 38, LEFT, TOP, 20, 60);
      }
      break;

    case 6:
      mostrarTexto("– Para comerte mejor\n\nDale ENTER para empezar de nuevo", 45, CENTER, CENTER, width / 2, height / 2);
      break;

    case 7:
      mostrarTexto("Dale click a Caperucita", 28, LEFT, TOP, 20, 30);
      break;

    case 8:
      mostrarTexto("Doble clic al lobo", 40, CENTER, TOP, width / 2, 20);
      break;

    case 9:
      mostrarTexto("Haz clic en los tres círculos", 40, LEFT, TOP, 20, 30);
      for (int i = 0; i < 3; i++) {
        if (!circulosClickeados[i]) {
          fill(0, 0, 255);
          ellipse(100 + i * 150, 700, 50, 50);
        }
      }
      break;

    case 10:
      mostrarTexto("¡Y sobrevivieron todos!\nDale ENTER para empezar de nuevo", 40, CENTER, BOTTOM, width / 2, height - 20);
      break;
  }
}

void mostrarTexto(String mensaje, int tam, int alignX, int alignY, float x, float y) {
  fill(255);
  textAlign(alignX, alignY);
  textSize(tam);
  text(mensaje, x, y);
}

void keyPressed() {
  if (escena == 0 && key == ENTER) escena = 1;
  else if (escena == 4 && key == ' ') escena = 5;
  else if (escena == 5 && key == 'c') mostrarConversacion = true;
  else if (escena == 5 && key == ' ' && mostrarConversacion) escena = 6;
  else if ((escena == 6 || escena == 10) && key == ENTER) {
    escena = 0;
    mostrarConversacion = false;
    crecimiento = 50;
    circulosClickeados = new boolean[3];
    clicksCirculoFinal = 0;
  }
}

void mouseClicked() {
  if (escena == 1 && dist(mouseX, mouseY, 120, 400) < 40) {
    escena = 2;
  } else if (escena == 1 && dist(mouseX, mouseY, width - 110, 400) < 40) {
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

void mousePressed() {
  if (escena == 8 && mouseX > 400 && mouseY < 400) {
    int currentTime = millis();
    if (currentTime - lastClickTime < clickInterval) {
      escena = 9;
    }
    lastClickTime = currentTime;
  }
}
