//print("hola");
//size(800,800);
//background(237,156,210);
//line(700,300,400,400);

int myInt = 4;
float myReal = 2.5;
char myChar= 'a';
String mystring = "hola";

boolean z = true;
color fondo_rojo = color (200, 10, 10); 
// SE EJECUTA UNA SOLA VEZ
void setup(){
  size(500, 500);
// se ejecuta una vez por fotograma
}
void draw(){
  background(50,250,100);
  //mueve ek origen del sistema de coordenadas
  translate(250, 270);
  //base
  fill(#14D839);
  ellipse (0, 50, 150, 40);
  //MANOS
  //base del cuerpo
  ellipse(0, 0, 100, 100);
  
  ellipse(-50, 25, 30, 50);
  ellipse(50, 25, 30, 50);
  
  //OJOS
  fill(255);
  ellipse(-30, -40, 50, 50);
  ellipse(30, -40, 50, 50);
  //pupilas
  fill(0);
  ellipse(-30, -40, 30, 30);
  ellipse(30, -40, 30, 30);
  //boca
  rectMode(CENTER);
  fill(255, 0, 0);
  rect(0, 10, 60, 10);
  //contenedor
  fill(#72CAF5, 100);
  ellipse(0, -10, 195, 195);
  //gotas
  noStroke();
  triangle(50, -80, 65, -65, 45, -75);
  triangle(50, -70, 65, -55, 45, -65);
  
}
  
  
