// Estados
//Referente de la historia de caperucita y chat gpt en el orden de diaologos.
int estado = 0;
PVector caperucita;

void setup() {
  size(800, 600);
  caperucita = new PVector(100, height / 2);
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
      caminoLobo_dialogo();
      break;
    case 3:
      loboDisfrazado();
      break;
    case 4:
      caminoAlternativo();
      break;
    case 5:
      climaxLobo();
      break;
    case 6:
      cazadorSalva();
      break;
    case 7:
      climaxAlternativo();
      break;
    case 8:
      desenlace();
      break;
  }

  // Dibujar a Caperucita
  fill(255, 0, 0);
  ellipse(caperucita.x, caperucita.y, 40, 40); // simplificado
}

// ------------------ ESTADOS --------------------

void mostrarInicio() {
  fill(0);
  text("Caperucita recibe una canasta para llevar a su abuelita.\nHaz clic para que comience a caminar.", 50, 100);
}

void mostrarBifurcacion() {
  fill(0);
  text("Caperucita llega a una bifurcación.\nPresiona '1' para seguir el camino del lobo.\nPresiona '2' para tomar un camino alternativo.", 50, 100);
}

void caminoLobo_dialogo() {
  fill(0);
  text("El lobo: ¿A dónde vas, niña?\nPresiona 'S' para responder.", 50, 100);
}

void loboDisfrazado() {
  fill(0);
  text("El lobo llegó antes y se disfrazó de la abuelita.\nHaz clic para continuar...", 50, 100);
}

void caminoAlternativo() {
  fill(0);
  text("Caperucita llega primero. Presiona 'A' para advertir a la abuelita.", 50, 100);
}

void climaxLobo() {
  fill(0);
  text("Caperucita: ¡Qué ojos tan grandes tienes!\nPresiona 'D' para continuar el diálogo.\nPresiona ESPACIO para que aparezca el cazador.", 50, 100);
}

void cazadorSalva() {
  fill(0);
  text("El cazador aparece y salva a la abuelita y a Caperucita.\nHaz clic para ver el final.", 50, 100);
}

void climaxAlternativo() {
  fill(0);
  text("El lobo se come a Caperucita y a la abuelita.\nHaz clic para ver al lobo lleno.", 50, 100);
}

void desenlace() {
  fill(0);
  if (finalBueno) {
    text("Final feliz: El cazador salvó a todos.\nFin.", 50, 100);
  } else {
    text("Final trágico: El lobo se los comió.\nFin.", 50, 100);
  }
}

// ------------------ INTERACCIONES --------------------
boolean finalBueno = false;

void mousePressed() {
  if (estado == 0) {
    caperucita.x += 50;
    estado = 1;
  } else if (estado == 3) {
    estado = 5;
  } else if (estado == 6 || estado == 7) {
    estado = 8;
  }
}

void keyPressed() {
  if (estado == 1) {
    if (key == '1') {
      estado = 2; // Camino del lobo
    } else if (key == '2') {
      estado = 4; // Camino alternativo
    }
  } else if (estado == 2 && key == 's') {
    estado = 3; // Lobo disfrazado
  } else if (estado == 4 && key == 'a') {
    estado = 7; // Lobo se los come
    finalBueno = false;
  } else if (estado == 5 && key == 'd') {
    // solo avanza diálogo, se queda en estado 5
  } else if (estado == 5 && key == ' ') {
    estado = 6; // Cazador aparece
    finalBueno = true;
  }
}

void mouseReleased() {
  println("Mouse liberado en: " + mouseX + ", " + mouseY);
}

void mouseMoved() {
  println("Mouse movido a: " + mouseX + ", " + mouseY);
}

void mouseDragged() {
  caperucita.x = mouseX;
  caperucita.y = mouseY;
  println("Arrastrando a Caperucita");
}
