
import processing.net.*;
Server s;
Client c;

void setup() {
  size(450, 255);
  background(204);
  stroke(0);
  frameRate(5); // Slow it down a little
  s = new Server(this,12345); // Start a simple server on a port
}
void draw(){
    if (mousePressed == true){
      s.write("Server: desde el servidor con <3");
      // println("server: "+s);
    }
}
