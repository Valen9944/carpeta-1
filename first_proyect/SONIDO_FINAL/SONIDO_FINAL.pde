// Referencia con chat gpt
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
FFT fft;
float time = 0;
boolean expandingTriangle = false;


void setup() {
  size(800, 800); 
  background(0); 
  minim = new Minim(this);
  player = minim.loadFile("spinning-head-271171.mp3", 1024); // audio
  player.play(); // Reproducir el audio
  fft = new FFT(player.bufferSize(), player.sampleRate()); 
  print("Sonido Laura Barrera");
}

// Función principal que se ejecuta en bucle
void draw() {
  background(0, 50);
  fft.forward(player.mix);
  float amplitude = player.mix.level() * 200; // Obtener amplitud de la música
  time += 0.02;
  
  // Secuencia de animaciones basadas en el tiempo transcurrido
  if (time < 5) {
    drawCircularMovingPoints(); // Fase 1: Movimiento circular de puntos
  } else if (time < 10) {
    drawExpandingCircle(amplitude); // Fase 2: Expansión de un círculo
  } else if (time < 15) {
    drawGrowingTriangles(); // Fase 3: Formación de triángulos
  } else if (time < 20) {
    drawShrinkingTriangles(); // Fase 4: Reducción de los triángulos
  } else if (time < 25) {
    drawDisintegratingIntoCircles(); // Fase 5: Desintegración en círculos
  } else if (time < 30) {
    drawFormingSquare(); // Fase 6: Formación de un cuadrado dinámico
  } else {
    time = 0; // Reiniciar el ciclo
  }
}

// Movimiento circular de puntos
void drawCircularMovingPoints() {
  translate(width / 2, height / 2);
  for (int i = 0; i < 100; i++) {
    float angle = map(i, 0, 100, 0, TWO_PI);
    float radius = noise(i * 0.1, frameCount * 0.01) * 300 * (time / 5);
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    stroke(255);
    point(x, y);
  }
}

//  Expansión de un círculo en base a la amplitud de la música
void drawExpandingCircle(float amplitude) {
  translate(width / 2, height / 2);
  noFill();
  stroke(255);
  ellipse(0, 0, amplitude * 4 * ((time - 5) / 5), amplitude * 4 * ((time - 5) / 5));
}

// Crecimiento de triángulos desde el centro
void drawGrowingTriangles() {
  translate(width / 2, height / 2);
  float scaleFactor = map(time, 10, 15, 10, width);
  for (int i = 0; i < 360; i += 30) {
    float angle = radians(i);
    float x = cos(angle) * scaleFactor;
    float y = sin(angle) * scaleFactor;
    stroke(255, 200);
    fill(255, 50);
    triangle(0, 0, x, y, x * 0.8, y * 0.8);
  }
}

// Reducción de los triángulos
void drawShrinkingTriangles() {
  translate(width / 2, height / 2);
  float scaleFactor = map(time, 15, 20, width, 10);
  for (int i = 0; i < 360; i += 30) {
    float angle = radians(i);
    float x = cos(angle) * scaleFactor;
    float y = sin(angle) * scaleFactor;
    stroke(255, 200);
    fill(255, 50);
    triangle(0, 0, x, y, x * 0.8, y * 0.8);
  }
}

//  Desintegración de la figura en círculos
void drawDisintegratingIntoCircles() {
  translate(width / 2, height / 2);
  float size = map(time, 20, 25, width / 2, 10);
  for (int i = 0; i < 100; i++) {
    float x = random(-size, size);
    float y = random(-size, size);
    stroke(255);
    fill(255);
    ellipse(x, y, 5, 5);
  }
}

//  Formación de un cuadrado dinámico con puntos
void drawFormingSquare() {
  translate(width / 2, height / 2);
  float size = map(sin(time * 2), -1, 1, 50, 200);
  for (int i = 0; i < 4; i++) {
    float angle = radians(45 + i * 90);
    float x = cos(angle) * size;
    float y = sin(angle) * size;
    stroke(255);
    fill(255, 50);
    ellipse(x, y, 10, 10);
  }
}
   
