import processing.net.*;
import de.bezier.data.sql.*;
import java.net.ConnectException.*;
//import java.net.SQLException;

Client c,c1;
String input,name="C1";


void setup()
{
  size(450, 255);
  background(204);
  stroke(0);
  frameRate(5); // Slow it down a little
  initGui();
  intiConexion();
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
   println("servidor: "+input);
   //setTAMensaje(input);
 }
}
