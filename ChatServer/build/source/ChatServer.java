import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.net.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ChatServer extends PApplet {



Server s;
Client c;

public void setup() {
  
  background(204);
  stroke(0);
  frameRate(5); // Slow it down a little
  s = new Server(this,12345); // Start a simple server on a port
}
public void draw(){
    if (mousePressed == true){
      s.write("Server: desde el servidor con <3");
      // println("server: "+s);
    }
}
  public void settings() {  size(450, 255); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ChatServer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
