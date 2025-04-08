// Estados posibles
int estado = 0; // 0: Inicio, 1: Bifurcación, 2: Camino del lobo, 3: Camino alternativo, 4: Clímax lobo, 5: Clímax alternativo, 6: Desenlace
PVector caperucita;

void setup() {
  size(800, 600);
  caperucita = new PVector(100, height/2);
}

void draw() {
  background(255);
  
  switch (estado) {
    case 0:
      mostrarInicio();
      break;
    case 1:
      mostrarBifurcacion();
      break;
    case 2:
      caminoDelLobo();
      break;
    case 3:
      caminoAlternativo();
      break;
    case 4:
      climaxLobo();
      break;
    case 5:
      climaxAlternativo();
      break;
    case 6:
      desenlace();
      break;
  }
}

// ---------- ESTADOS / ESCENAS -----------
void mostrarInicio() {
  fill(0);
  text("Caperucita recibe una canasta para llevar a su abuelita.\nHaz clic para comenzar el viaje.", 50, 100);
  ellipse(caperucita.x, caperucita.y, 40, 40); // Representa a Caperucita
}

void mostrarBifurcacion() {
  fill(0);
  text("Caperucita llega a una bifurcación.\nPresiona '1' para seguir el camino del lobo.\nPresiona '2' para tomar un camino alternativo.", 50, 100);
  ellipse(caperucita.x, caperucita.y, 40, 40);
}

void caminoDelLobo() {
  fill(0);
  text("El lobo aparece y habla con Caperucita.\nPresiona 'S' para continuar el diálogo.", 50, 100);
}

void caminoAlternativo() {
  fill(0);
  text("Caperucita tomó el camino seguro y llega a la casa.\nPresiona 'A' para advertir a la abuelita.", 50, 100);
}

void climaxLobo() {
  fill(0);
  text("Caperucita entra a la casa y nota algo raro.\nPresiona 'D' para continuar el diálogo.\nPresiona 'ESPACIO' para que aparezca el cazador.", 50, 100);
}

void climaxAlternativo() {
  fill(0);
  text("Caperucita y la abuelita se esconden del lobo.\nHaz clic para ver el mensaje final.", 50, 100);
}

void desenlace() {
  fill(0);
  text("Final: Caperucita aprendió a no hablar con extraños.", 50, 100);
}

// ---------- INTERACCIONES -----------
void mousePressed() {
  if (estado == 0) {
    caperucita.x += 100;
    estado = 1;
  } else if (estado == 3) {
    estado = 5;
  } else if (estado == 5 || estado == 4) {
    estado = 6;
  }
}

void keyPressed() {
  if (estado == 1) {
    if (key == '1') estado = 2;
    if (key == '2') estado = 3;
  }
  if (estado == 2 && key == 's') estado = 4;
  if (estado == 3 && key == 'a') estado = 5;
  if (estado == 4 && key == 'd') {
    // siguiente parte del diálogo
  }
  if (estado == 4 && key == ' ') {
    estado = 6;
  }
}

void mouseReleased() {
  println("Mouse liberado en posición: " + mouseX + ", " + mouseY);
}

void mouseMoved() {
  println("Mouse movido. Posición: " + mouseX + ", " + mouseY);
}

void mouseDragged() {
  caperucita.x = mouseX;
  caperucita.y = mouseY;
  println("Arrastrando a Caperucita");
}
