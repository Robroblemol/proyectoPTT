import processing.net.*;
import de.bezier.data.sql.*;
import java.sql.SQLException;


Server sc,sdb;
Client cc,cdb;
String input;
MySQL msql;
String data [];

void setup() {
  size(100, 100);
  background(204);
  stroke(0);
  frameRate(5); // Slow it down a little
  sc = new Server(this,12347); // Servicio chat
  sdb = new Server(this,12348);// servicio login

    String user     = "root";
    String pass     = "1234";
    String database = "login";
    msql = new MySQL( this, "localhost:3306", database, user, pass );
    if(msql.connect()){ println("conexion a DB!!");}

}
void draw(){
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
