void addUsuario(String name,String pass ) {
  msql.query("INSERT INTO usuarios (name,pass) VAlUES ("+name+","+pass+")" );
  msql.next();
}
String getUsuario(String name){
  msql.query("SELECT name, pass FROM usuarios WHERE name ="+name);
  msql.next();
  return msql.getString(1)+" "+msql.getString(2);
}
