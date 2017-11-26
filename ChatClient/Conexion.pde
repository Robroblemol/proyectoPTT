import java.net.ConnectException;
//import java.rmi.ConnectException.*;
//Client c,c1;
void intiConexion(){

  try{
    connectChat(12345);
    connectDb(12346);
    if(!c.active()||!c1.active()){
      ExceptionTest e = new ExceptionTest("error de conexion");
      throw e;
    }
  }catch(ExceptionTest  e){
    try{
        connectChat(12348);
        connectDb(12347);
          if(!c.active()||!c1.active()){
            ExceptionTest ex = new ExceptionTest("error de conexion");
            throw e;
          }

    }catch(ExceptionTest  ex){
      try{
          connectChat(12350);
          connectDb(12349);
            if(!c.active()||!c1.active()){
              ExceptionTest exc = new ExceptionTest("error de conexion");
              throw e;
            }

      }catch(ExceptionTest  exc){
        println("imposiple conexion a servidores"+exc);
        G4P.showMessage(this,
        "conexion a servidores fallida",
        "Error de conexion",
        G4P.ERROR );
      }
    }
  }
}
void connectChat(int port ) throws ExceptionTest {
  println("Chat intentando conexion al puerto: "+port);
  c = new Client(this, "127.0.0.1",port);
}
void connectDb(int port ) throws ExceptionTest {
  println("Db intentando conexion al puerto: "+port);
  c1 = new Client(this, "127.0.0.1", port);
}
