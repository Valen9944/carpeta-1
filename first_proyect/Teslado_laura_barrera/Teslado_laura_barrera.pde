void setup() {
  size(800, 800);
  background(0);
  print("Laura Barrera Teslado");
}

void draw() {
  color[] colores = {color(255, 165, 0), color(0, 100, 255), color(0, 180, 0)}; // Naranja, Azul y Verde
  int size = 60; // tamaño de los triángulos

  for (int i = 0; i < width; i += size) {  
    for (int j = 0; j < height; j += size) {
      
      int index = (i / size + j / size) % 3; // Alternar colores
      fill(colores[index]);
      noStroke();

    // Alternar la orientación de los triángulos
      if ((i / size + j / size) % 2 == 0) {
        triangle(i, j, i + size, j, i + size / 2, j + size);
      } else {
        triangle(i, j + size, i + size, j + size, i + size / 2, j);
      }
    }
  }
}
