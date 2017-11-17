import processing.net.*;
import de.bezier.data.sql.*;
import java.sql.SQLException;

Server s;
Client c;
String input;
MySQL msql;

void setup() {
  size(450, 255);
  background(204);
  stroke(0);
  frameRate(5); // Slow it down a little
  s = new Server(this,12346); // Start a simple server on a port
  s.write("conexion a Dbserver");
//conexion a base de datos

String user     = "root";
String pass     = "1234";
String database = "login";
msql = new MySQL( this, "localhost:3306", database, user, pass );


}
void draw(){
  if (mousePressed == true){
      s.write("DbServer: Servidor DB ");
      // println("server: "+s);
    }
  c = s.available();
  if(c != null){
    input = c.readString();
    
    s.write(input);
  }
}
