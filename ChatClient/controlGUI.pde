void setTAMensaje (String s) {
  String sm;
  sm = txa1.getText()+s+"\n";
  txa1.setText(sm);
}
void sendRegistro( ) {
  String p =txfPass.getPassword();
  String u =txfUsuario.getText();
  println("add "+u+" "+p+"\n");
  c1.write("add "+u+" "+p+"\n");
}
