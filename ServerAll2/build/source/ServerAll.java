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
  sdb = new Server(this,12346);// servicio login

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
    cdb = sdb.available();
    if(cdb != null){
    input = cdb.readString();
    input.substring(0, input.indexOf("\n")); // Only up to the newline
    //s.write(input);
    data = split(input,' ');
    if(data[0].equals("add")==true)
      addUsuario(data[1],data[2]);
    else if(data[0].equals("get")==true){
      respUsuario(data[1]);
      //sdb.write(str);
    }
  }

}

public void addUsuario(String n,String p) {
  println("INSERT INTO usuarios (name,pass) VAlUES ('"+n+"','"+p+"')");
  respUsuario(n);
  msql.query("INSERT INTO usuarios (name,pass) VAlUES ('"+n+"','"+p+"')");
  msql.next();
}
public String getUsuario(String n) {

  msql.query("SELECT name, pass FROM usuarios WHERE name = '"+n+"'");
  msql.next();
      println(msql.getString(1)+" "+msql.getString(2));
      return msql.getString(1)+" "+msql.getString(2);

}
public void respUsuario(String n){
    String r = getUsuario(n);
    sdb.write("server: "+r);
    //sdb.write("server: "+r+"\n");
}
  public void settings() {  size(100, 100); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ServerAll" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
