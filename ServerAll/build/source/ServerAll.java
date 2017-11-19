import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.net.*; 
import de.bezier.data.sql.*; 
import java.sql.SQLException; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ServerAll extends PApplet {





Server sc,sdb;
Client cc,cdb;
String input;
MySQL msql;
String data [];

public void setup() {
  
  background(204);
  stroke(0);
  frameRate(5); // Slow it down a little
  sc = new Server(this,12345); // Servicio chat
  sdb = new Server(this,1236);// servicio login

    String user     = "root";
    String pass     = "1234";
    String database = "login";
    msql = new MySQL( this, "localhost:3306", database, user, pass );
    if(msql.connect()){ println("conexion a DB!!");}

}
public void draw(){
    if (mousePressed == true){
      sc.write("Server: desde el servidor con <3");
      // println("server: "+s);
    }
    cc = sc.available();
    if(cc != null){
      input = cc.readString();
      sc.write(input);
    }
}
public void addUsuario(String name,String pass ) {
  msql.query("INSERT INTO usuarios (name,pass) VAlUES ("+name+","+pass+")" );
  msql.next();
}
public String getUsuario(String name){
  msql.query("SELECT name, pass FROM usuarios WHERE name ="+name);
  msql.next();
  //return msql.getString(1)+" "+msql.getString(2);
  return msql.getString(2);
}
  public void settings() {  size(450, 255); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ServerAll" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
