void setTAMensaje (String s) {
  String sm;
  sm = txa1.getText()+s+"\n";
  txa1.setText(sm);
}
void sendRegistro(String coman ) {
  String p =txfPass.getPassword();
  String u =txfUsuario.getText();
  name=u;
  pass=p+'\n';
  println(coman+" "+u+" "+p+"\n");
  c1.write(coman+" "+u+" "+p+"\n");
  surface.setTitle("Cliente-"+name);
}
