void setup() {
  size(500, 500);  // Tamaño del lienzo
  background(135, 206, 250);  // Azul cielo
  print("COLOR Y FORMA Laura Barrera");
}

void draw() {
  // Sol
  fill(255, 204, 0);  // Amarillo
  ellipse(400, 100, 80, 80);  // Círculo del sol

  // Casa
  fill(200, 100, 50);  // Marrón 
  rect(150, 250, 200, 200);  // Cuerpo de la casa

  // Techo
  fill(150, 50, 30);  // Marrón oscuro
  triangle(140, 250, 260, 150, 360, 250);  // Triángulo del techo

  // Puerta
  fill(100, 50, 0);  // Marrón oscuro
  rect(230, 350, 40, 100);  // Puerta

  // Ventanas
  fill(255);  // Blanco
  rect(170, 280, 50, 50);  // Ventana izquierda
  rect(280, 280, 50, 50);  // Ventana derecha

  // Líneas  de ventanas
  stroke(0);
  line(195, 280, 195, 330);  // Ventana izquierda vertical
  line(170, 305, 220, 305);  // Ventana izquierda horizontal
  line(305, 280, 305, 330);  // Ventana derecha vertical
  line(280, 305, 330, 305);  // Ventana derecha horizontal
  
}
