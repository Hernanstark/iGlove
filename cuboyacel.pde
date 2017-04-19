import processing.serial.*;

Serial puerto;

int accX, accY, accZ, pitch, roll;
float rotX=0.0, rotY=0.0, gX, gY, gZ;
int lastX,lastY;
float distX=0.0, distY=0.0;

void setup()
{
 size(400,400,P3D);
 noStroke();
 fill(0,255,150);
 puerto = new Serial(this, Serial.list()[0], 9600);
 //puerto.clear();
 puerto.bufferUntil('\n');
}

 void draw()
 {
  background(0);
  lights();
  translate(width/2,  height/2);
  rotateX(rotX + distY);
  rotateY(rotY + distX);
  box(150,150,150);
 }
 
 void mousePressed()
 {
   lastX=mouseX;
   lastY=mouseY;
 }
 void mouseDragged()
 {
   distX=radians(mouseX-lastX);
   distY=radians(lastY-mouseY);
 }
 void mouseReleased()
 {
   rotX+=distY;
   rotY+=distX;
   distX=distY=0.0;
 }
 
 void serialEvent (Serial puerto)  
 { 
 
   String prueba = puerto.readStringUntil('\n'); 
   if (prueba != null)
   { 
     String[] list = split(prueba, ':'); 
     pitch = ((int)float(list[0])); 
     roll = ((int)float(list[1])); 
   } 
    String[] list = split(prueba, ':');
      accX= int(list[0]) - 512;
      accY= int(list[1]) - 512;
      accZ= int(list[2]) - 512;
         
  println(roll);
  print(accX); print('\t');
  print(accY); print('\t');
  println(accZ); 
  
 } 