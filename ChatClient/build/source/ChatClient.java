import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.net.*; 
import g4p_controls.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ChatClient extends PApplet {



Client c;
String input;

public void setup()
{
  
  background(204);
  stroke(0);
  frameRate(5); // Slow it down a little
  initGui();
  // Connect to the server's IP address and port
  c = new Client(this, "127.0.0.1", 12345); // Replace with your server's IP and port
}
public void draw( ) {
  background(204);
  if (c.available() > 0) {
   input = c.readString();
   println("cliente: "+input);
   setTAMensaje(input);
 }
}
//importamos libreria
GTextField txfMessage;
GButton bSend;
GTextArea txa1;

public void initGui( ) {
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  //G4P.setCursor(ARROW);
  surface.setTitle("Cliente");
  createControlGruop();
}
public void createControlGruop( ) {
  bSend = new GButton(this, 345,215,100,35,"Enviar");
  bSend.fireAllEvents(true);

  txfMessage = new GTextField(this,10,215,330,35);
  txfMessage.tag = "txfMessage";
  txfMessage.setPromptText("Escriba aqui perro");

  txa1 = new GTextArea(this, 10, 105, 445, 100,G4P.SCROLLBARS_BOTH);
  txa1.tag = "txa1";
  
}
public void setTAMensaje (String s) {
  String sm;
  sm = txa1.getText()+s+"\n";
  txa1.setText(sm);
}
  public void settings() {  size(450, 255); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ChatClient" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
