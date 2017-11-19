import g4p_controls.*;//importamos libreria
GTextField txfMessage,txfUsuario;
GPassword txfPass;
GButton bSend,bRegistar,bIniciar;
GTextArea txa1;
GWindow window;
GLabel lbUsuario, lbPass;

void initGui( ) {
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  //G4P.setCursor(ARROW);
  surface.setTitle("Cliente");
  newWindow();
  createControlGruop();
}
void createControlGruop( ) {
  bSend = new GButton(this, 345,215,100,35,"Enviar");
  bSend.fireAllEvents(true);
  bSend.setVisible(false);

  txfMessage = new GTextField(this,10,215,330,35);
  txfMessage.tag = "txfMessage";
  txfMessage.setPromptText("Escriba aqui perro");
  txfMessage.setVisible(false);

  txa1 = new GTextArea(this, 10, 105, 445, 100,G4P.SCROLLBARS_VERTICAL_ONLY);
  txa1.tag = "txa1";
  txa1.setEnabled (false);
  txa1.setVisible(false);

}
void handleButtonEvents(GButton button, GEvent event) {
//setTAMensaje(name+": "+txfMessage.getText());
if(button==bSend&&event==GEvent.PRESSED){
  c.write(name+": "+txfMessage.getText());
  txfMessage.setText("");
}
if(button==bIniciar&&event==GEvent.PRESSED){
    sendRegistro("get");
  }
  if(button==bRegistar&&event==GEvent.PRESSED){
      sendRegistro("add");
    }
}
void showControls(){
  bSend.setVisible(true);
  txfMessage.setVisible(true);
  txa1.setVisible(true);
}
void newWindow(){
  window = GWindow.getWindow(this, "Mover Plaza", 500, 250, 245, 230, JAVA2D);
  window.addDrawHandler(this, "drawWin");
  txfUsuario = new GTextField(window,70,60,100,20);
  txfUsuario.setPromptText("Usuario");
  txfPass = new GPassword(window,70,90,120,20);
  txfPass.tag="txfPass";
  txfPass.setMaxWordLength(20);
  bIniciar = new GButton(window,80,125,100,35,"Ingresar");
  bIniciar.fireAllEvents(true);
  bRegistar = new GButton(window,80,177,100,35,"Registrar");
  bRegistar.fireAllEvents(true);
}
