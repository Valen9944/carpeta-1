// referencia con ayuda de chat gpt
Table movies;
PFont font;

float offsetX = 0;      // Desplazamiento horizontal
float zoom = 1.0;       // Zoom
float minYear = 1920;
float maxYear = 2025;
float baseY;

void setup() {
  size(1400, 600);
  movies = loadTable("imdb_top_250.csv", "header");
  font = createFont("Arial", 12);
  textFont(font);
  baseY = height / 2;
}

void draw() {
  background(20);
  fill(255);
  textSize(20);
  text("IMDb Top 250 - Timeline Interactiva", 40, 40);
  
  drawTimeline();
  drawMovies();
}

void drawTimeline() {
  stroke(150);
  strokeWeight(2);
  line(0, baseY, width, baseY);
  
  // Etiquetas de años
  for (int year = int(minYear); year <= maxYear; year += 10) {
    float x = map(year, minYear, maxYear, 0, width * zoom) + offsetX;
    if (x > 0 && x < width) {
      stroke(100);
      line(x, baseY - 10, x, baseY + 10);
      fill(200);
      textSize(12);
      textAlign(CENTER);
      text(year, x, baseY + 25);
    }
  }
}

void drawMovies() {
  for (TableRow row : movies.rows()) {
    float year = row.getFloat("Year");
    float rating = row.getFloat("Rating");
    int runtime = row.getInt("Runtime");
    String title = row.getString("Title");
    
    float x = map(year, minYear, maxYear, 0, width * zoom) + offsetX;
    float y = baseY;
    
    if (x > -10 && x < width + 10) {
      noStroke();
      fill(255, 150, 50);
      ellipse(x, y, 8, 8);
      
      if (dist(mouseX, mouseY, x, y) < 6) {
        // Mostrar tooltip
        fill(255);
        rect(mouseX + 10, mouseY - 50, 300, 60);
        fill(0);
        textAlign(LEFT);
        textSize(12);
        text("Título: " + title, mouseX + 15, mouseY - 35);
        text("Año: " + int(year) + " | Rating: " + rating, mouseX + 15, mouseY - 20);
        text("Duración: " + runtime + " min", mouseX + 15, mouseY - 5);
      }
    }
  }
}

// Interacción: mover timeline con teclas
void keyPressed() {
  if (keyCode == LEFT) {
    offsetX += 50;
  } else if (keyCode == RIGHT) {
    offsetX -= 50;
  } else if (key == '+') {
    zoom *= 1.1;
  } else if (key == '-') {
    zoom *= 0.9;
  }
}
