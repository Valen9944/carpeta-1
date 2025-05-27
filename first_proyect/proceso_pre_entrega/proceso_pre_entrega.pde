PImage[] escenas;
PFont fuenteMedieval;
int escena = 0;
PImage canasta, manzana;
PImage hacha;
PImage hoja;
float[] hojaX = new float[5];
float[] hojaY = new float[5];
import ddf.minim.*;

Minim minim;
AudioPlayer musica;

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
  
  minim = new Minim(this);
musica = minim.loadFile("midnight-forest-184304.mp3");  
musica.loop();

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
  canasta = loadImage("canasta.png");
  manzana = loadImage("manzana.png");
  hacha = loadImage("hachaaa.png");
  hoja = loadImage("hojaas.png");
for (int i = 0; i < 5; i++) {
  hojaX[i] = random(width);
  hojaY[i] = random(-200, -50);  // Empiezan fuera de pantalla
}
  
}

void draw() {
  background(255);
  image(escenas[escena], 0, 0, width, height);

fuenteMedieval = loadFont("AcademyEngravedLetPlain-40.vlw");
textFont(fuenteMedieval);

  // Estilo del texto
  fill(255);
  textAlign(CENTER, CENTER);
  
  // comandos  escena 0

switch (escena) {
    case 0:
      textAlign(CENTER, CENTER);
      textSize(40);
      text("Dale ENTER para empezar", width / 2, height / 2);
      break;
      
// escena 1 opcion de circulo o rectangulo

    case 1:
  image(canasta, circuloX - 25, circuloY - 25, 100, 100);
      image(manzana, width - 150, 400, 100, 100);
      textAlign(CENTER, CENTER);
      textSize(40);
      text("Escoge tu camino", width / 2, height / 2);
      break;

      
// escena 2 

    case 2:
   textAlign(LEFT, BOTTOM);
  textSize(40);
  fill(255);
  text("Haz click en el lobo", 30, 750);

  // Texto narrativo en la parte inferior derecha
  textSize(20);
  textAlign(RIGHT, BOTTOM);
  fill(255);
  text("Caperucita, al escoger la canasta,\nla llevó a un camino desconocido,\nen donde lo único que escuchaba\neran las ramas de los árboles moverse.\nEn ese momento apareció un gran lobo.", width - 20, height - 20);
  break;

      
// escena 3 comando circulo que crece
    case 3:
         fill(255, 0, 0, 150);
      ellipse(width / 2, height / 2, crecimiento, crecimiento);
      
        // Texto de instrucción
  textAlign(LEFT, BOTTOM);
  textSize(40);
  fill(255);
  text("Haz click en el círculo para escapar", 30, 750);

  // Texto narrativo parte superior izquierda
  textSize(25);
  textAlign(LEFT, TOP);
  fill(255);
  text("Caperucita sintió un estruendo que sacudió todo su cuerpo, un miedo\ntan intenso que su única reacción\nfue salir corriendo, lejos del lobo.", 20, 20);
  break;


// escena 4 

    case 4:
       textAlign(CENTER, CENTER);
  textSize(40);
  fill(255);
  text("Dale ESPACIO", width / 2, height / 2);
  
    // Mostrar y animar hojas
  for (int i = 0; i < 5; i++) {
    image(hoja, hojaX[i], hojaY[i], 60, 80); // Puedes ajustar tamaño
    hojaY[i] += 2;  // Velocidad
    if (hojaY[i] > height) {
      hojaY[i] = random(-200, -50);
      hojaX[i] = random(width);
    }
  }
  
  
  
  
  

  // Texto narrativo parte superior derecha
  textAlign(RIGHT, TOP);
  textSize(20);
  fill(255);
  text("El lobo llegó antes que\nCaperucita a la casa de\nla abuelita y decidió\nprepararlo todo para su llegada.", width - 20, 20);
  break;
  
// escena 5 conversacion

    case 5:
   textAlign(LEFT, TOP);
  textSize(30);
  fill(255);
  if (!mostrarConversacion) {
    text("Dale a la letra C para ver la conversación", 20, 30);
  } else {
    text("– Abuelita, ¿por qué estás tan rara?\n– Para nada, mijita\nDale ESPACIO", 20, 60);
  }

  // Texto narrativo parte inferior derecha
  textAlign(RIGHT, BOTTOM);
  textSize(20);
  fill(255);
  text("El lobo devoró a la abuelita\nde Caperucita, tomó sus pertenencias\ny se disfrazó con ellas para engañar a la niña.", width - 20, height - 20);
  break;
      
// escena 6 termina la primera variable

    case 6:
      textAlign(CENTER, CENTER);
      textSize(45);
      text("– Para comerte mejor\n\nDale ENTER para empezar de nuevo", width / 2, height / 2);
      break;

// escena 7 inicia segunda variable


    case 7:
      textAlign(LEFT, TOP);
  textSize(30);
  fill(255);
  text("Dale click a Caperucita", 20, 30);

  // Mostrar y mover hojas
  for (int i = 0; i < 5; i++) {
    image(hoja, hojaX[i], hojaY[i], 60, 80);  // Tamaño ajustable
    hojaY[i] += 2;  // Velocidad de caída
    if (hojaY[i] > height) {
      hojaY[i] = random(-200, -50);
      hojaX[i] = random(width);
    }
  }

  // Texto narrativo parte inferior central
  textAlign(CENTER, BOTTOM);
  textSize(20);
  fill(255);
  text("Caperucita tomó un atajo y logró\nllegar antes que el lobo a la casa de su abuelita.", width / 2, height - 20);
  break;
      
// escena 8

    case 8:
    textAlign(LEFT, TOP);
  textSize(40);
  fill(255);
  text("Doble click al lobo", 20, 30);

  // Texto narrativo parte inferior central
  textAlign(CENTER, BOTTOM);
  textSize(20);
  fill(255);
  text("El lobo tomó ropa de la abuelita y la buscaba por toda la casa.\nMientras tanto, Caperucita y su abuelita estaban escondidas, planeando cómo escapar.", width / 2, height - 20);
  break;


      
// escena 9 - 3 circulos comando if

    case 9:
    
  textSize(40);
    fill(255);
  textAlign(CENTER, CENTER);
  text("Haz click en las tres hachas",width / 2, height / 2);
  
  // Texto narrativo en la parte superior derecha
  textAlign(RIGHT, TOP);
  textSize(20);
  fill(255);
  text("Un albañil que pasaba por \nla zona vio al lobo entrar en la\ncasa y, sin pensarlo, decidió enfrentarlo.", width - 20, 20);
  for (int i = 0; i < 3; i++) {
    float x = 100 + i * 150;
    if (!circulosClickeados[i]) {
      image(hacha, x - 40, 650, 80, 80);
    }
  }
  break;

// escena 10 segundo final

    case 10:
  textAlign(CENTER, TOP);
  textSize(20);
  fill(255);
  text("Como moraleja, podemos ver\nque cada persona tiene libre\nalbedrío en las decisiones de su vida,\nlo que puede llevarla a finales muy distintos.", width / 2, 20);

  // Texto de instrucción
  textAlign(CENTER, BOTTOM);
  textSize(40);
  text("¡Y sobrevivieron todos!\nDale ENTER para empezar de nuevo", width / 2, height - 20);
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
    if (escena == 1 && mouseX > circuloX - 25 && mouseX < circuloX + 75 && mouseY > circuloY - 25 && mouseY < circuloY + 75) {
  escena = 2; // si hace clic en la canasta
} else if (escena == 1 && mouseX > width - 150 && mouseX < width - 50 && mouseY > 400 && mouseY < 500) {
  escena = 7; // si hace clic en la manzana
}
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
