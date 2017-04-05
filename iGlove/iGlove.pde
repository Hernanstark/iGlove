PImage bg;
int lcolor=255;

void setup(){

size(600,400);
bg=loadImage("bg.jpg");
background(bg);



}

void draw(){
  
 dibujar();
 borrar();
}

void mousePressed(){
  
  //background(bg);
}

void dibujar()
{
  if(keyPressed)
  {
    if (key == 'r' || key == 'R')
    lcolor=(#FF0000);
    
    if (key == 'b' || key == 'B')
    lcolor=(#0000FF);
    
    if (key == 'g' || key == 'G')
    lcolor=(#00FF00);
    
  }
  if(mousePressed && (mouseButton == LEFT))
    {
    stroke(lcolor);
    line(pmouseX,pmouseY,mouseX,mouseY);
    }
}

void borrar()
{
  if(mousePressed && (mouseButton == RIGHT))
   {
    
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(mouseX,mouseY,100,50);
   }
}