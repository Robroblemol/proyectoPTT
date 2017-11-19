import processing.net.*;
import de.bezier.data.sql.*;
import java.sql.SQLException;

Server sc,sdb;
Client cc,cdb;
String input;
MySQL msql;
String data [];

void setup() {
  size(450, 255);
  background(204);
  stroke(0);
  frameRate(5); // Slow it down a little
  sc = new Server(this,12345); // Servicio chat
  sdb = new Server(this.1236;// servicio login
}
void draw(){
    if (mousePressed == true){
      sc.write("Server: desde el servidor con <3");
      // println("server: "+s);
    }
    c = sc.available();
    if(cc != null){
      input = cc.readString();
      sc.write(input);
    }
}
