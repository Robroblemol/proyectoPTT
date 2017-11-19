import processing.net.*;
import de.bezier.data.sql.*;
import java.net.ConnectException.*;
//import java.net.SQLException;

Client c,c1;
String input,name="C1",pass;
String data [];
Boolean flagLog = false;


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
   print(input);
try{
    input.substring(0, input.indexOf("\n")); // Only up to the newline
    data = split(input,' ');
    if(data[0].equals("server:") == true){
      print("data 1:"+data[1]+"|");
      println("data 2:"+data[2]+"|");
      verifiLog(data[1],data[2]);
    }
  //setTAMensaje(input);
  }catch(StringIndexOutOfBoundsException e){
    println("error String: "+ e);
    G4P.showMessage(this,
    "Verifique nombre se usuario y contraseña",
    "Error login",
    G4P.ERROR );
  }

  }
  if(flagLog){
    showControls();
    window.setVisible(false);
  }
}
void verifiLog(String n,String p ) {
  println("n:"+name.equals(n)+" \n"
          +"p:"+pass.equals(p));
  if(name.equals(n)==true&&pass.equals(p)==true)
    flagLog=true;
  else{
    G4P.showMessage(this,
    "Verifique nombre se usuario y contraseña",
    "Error login",
    G4P.ERROR );
  }
  println("flagLog: "+flagLog);
}
