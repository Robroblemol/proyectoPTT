import processing.net.*;

Client c,c1;
String input,name="C1";


void setup()
{
  size(450, 255);
  background(204);
  stroke(0);
  frameRate(5); // Slow it down a little
  initGui();
  // Connect to the server's IP address and port
  c = new Client(this, "127.0.0.1", 12345); // Replace with your server's IP and port
  c1 = new Client(this, "127.0.0.1", 12346); // Replace with your server's IP and port
}
void draw( ) {
  background(204);
  if (c.available() > 0) {
   input = c.readString();
   println("cliente: "+input);
   setTAMensaje(input);
 }
 if(c1.available() > 0){
   input = c1.readString();
   println("cliente: "+input);
   setTAMensaje(input);
 }
}
