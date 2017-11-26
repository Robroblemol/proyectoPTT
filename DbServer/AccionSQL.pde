
void addUsuario(String n,String p) {
  println("INSERT INTO usuarios (name,pass) VAlUES ('"+n+"','"+p+"')");
  respUsuario(n);
  msql.query("INSERT INTO usuarios (name,pass) VAlUES ('"+n+"','"+p+"')");
  msql.next();
}
String getUsuario(String n) {

  msql.query("SELECT name, pass FROM usuarios WHERE name = '"+n+"'");
  msql.next();
      println(msql.getString(1)+" "+msql.getString(2));
      return msql.getString(1)+" "+msql.getString(2);

}
void respUsuario(String n){
    String r = getUsuario(n);
    s.write("server: "+r);
    //sdb.write("server: "+r+"\n");
}
