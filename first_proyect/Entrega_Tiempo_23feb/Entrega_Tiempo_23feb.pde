// Variables para la hora
// Referencia de chat gpt
int h;
int m;
int s;
String timeString;

// Variables para el tamaño del texto
float textSizeBase = 60;  // Tamaño base del texto
float textSizeCurrent = textSizeBase;
float growthSpeed = 2;  // Velocidad de crecimiento

// Variables para las pepitas de colores
int numPepitas = 100;
float[] pepitaX = new float[numPepitas];
float[] pepitaY = new float[numPepitas];
float[] pepitaSpeedX = new float[numPepitas];
float[] pepitaSpeedY = new float[numPepitas];
color[] pepitaColor = new color[numPepitas];

// Configuración de tipografía
PFont fuente;

// Variables para la separación de los números
float offsetMax = 150;
float offset = 0;
boolean expand = true;

void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  // Cargar fuente y establecer tamaño
  fuente = createFont("Arial-Bold", textSizeBase);
  textFont(fuente);
  
  // Inicializar pepitas de colores
  for (int i = 0; i < numPepitas; i++) {
    pepitaX[i] = random(width);
    pepitaY[i] = random(height);
    pepitaSpeedX[i] = random(-2, 2);
    pepitaSpeedY[i] = random(-2, 2);
    pepitaColor[i] = color(random(360), 80, 100);
  }
  
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0);
  
  // Dibujar pepitas de colores en movimiento
  for (int i = 0; i < numPepitas; i++) {
    fill(pepitaColor[i]);
    noStroke();
    ellipse(pepitaX[i], pepitaY[i], 10, 10);
    
    // Mover pepitas
    pepitaX[i] += pepitaSpeedX[i];
    pepitaY[i] += pepitaSpeedY[i];
    
    // Rebote en los bordes
    if (pepitaX[i] < 0 || pepitaX[i] > width) pepitaSpeedX[i] *= -1;
    if (pepitaY[i] < 0 || pepitaY[i] > height) pepitaSpeedY[i] *= -1;
    
    // Cambio de color aleatorio
    if (random(100) < 1) {
      pepitaColor[i] = color(random(360), 80, 100);
    }
  }
  
  // Obtener hora actual
  h = hour();
  m = minute();
  s = second();
  
  // Formato de la hora
  timeString = nf(h, 2) + ":" + nf(m, 2) + ":" + nf(s, 2);
  
  // Control del tamaño de texto:
  // - Cada segundo se agranda y luego se vuelve pequeño
  
  textSizeCurrent += growthSpeed;
  
  // Cambio de dirección en el tamaño para el efecto de pulso
  if (textSizeCurrent > textSizeBase * 1.5 || textSizeCurrent < textSizeBase) {
    growthSpeed *= -1;
  }
  
  // Limitar el tamaño para que no crezca demasiado
  textSizeCurrent = constrain(textSizeCurrent, textSizeBase, textSizeBase * 1.5);
  
  // Control de separación:
  // - Separa horas, minutos y segundos
  // - Luego vuelve a juntarlos
  if (expand) {
    offset += 2;
    if (offset > offsetMax) {
      expand = false;
    }
  } else {
    offset -= 2;
    if (offset < 0) {
      expand = true;
    }
  }
  
  // Dibujar la hora con separación dinámica
  fill(255);
  textSize(textSizeCurrent);
  text(nf(h, 2), width / 2 - offset, height / 2);
  text(nf(m, 2), width / 2, height / 2);
  text(nf(s, 2), width / 2 + offset, height / 2);
}
