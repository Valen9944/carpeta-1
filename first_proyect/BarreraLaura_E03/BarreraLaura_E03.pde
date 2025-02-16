int numCircles = 20; // Numero de figuras en el lienzo
float[] x, y, xSpeed, ySpeed, sizeFactor;
color[] colors;

void setup() {
  size(800, 800);
  noStroke();
  frameRate(60);
  colorMode(HSB, 360, 100, 100); //HSB para manejar los colores en el espacio HSB (Hue, Saturation, Brightness).
  

  x = new float[numCircles];
  y = new float[numCircles];
  xSpeed = new float[numCircles];
  ySpeed = new float[numCircles];
  sizeFactor = new float[numCircles];
  colors = new color[numCircles];

 //velocidad, tamano del circulo 
 
  for (int i = 0; i < numCircles; i++) {
    x[i] = random(width);
    y[i] = random(height);
    xSpeed[i] = random(1, 4) * (random(1) > 0.5 ? 1 : -1);
    ySpeed[i] = random(1, 4) * (random(1) > 0.5 ? 1 : -1);
    sizeFactor[i] = random(20, 50);
    colors[i] = color(random(360), 80, 100); // Colores vivos
  }
}

void draw() {
  background(0, 0, 10, 20); // Oscuro con ligera transparencia


//inicializacion;     condicion;    incremento
  for (int i = 0; i < numCircles; i++) {
    x[i] += xSpeed[i];
    y[i] += ySpeed[i];

    if (x[i] <= 0 || x[i] >= width) xSpeed[i] *= -1;
    if (y[i] <= 0 || y[i] >= height) ySpeed[i] *= -1;

    float dynamicSize = sizeFactor[i] + sin(frameCount * 0.05 + i) * 10;
    fill(colors[i]);
    ellipse(x[i], y[i], dynamicSize, dynamicSize);
    // map() para modificar el color en función de la posición y el tamaño de los círculos.
    // Cada círculo tiene un tamaño variable que oscila con sin() haciendo el moviemiento
  }
}
