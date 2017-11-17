import g4p_controls.*;//importamos libreria
GTextField txfMessage;
GButton bSend;
GTextArea txa1;

void initGui( ) {
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  //G4P.setCursor(ARROW);
  surface.setTitle("Cliente");
  createControlGruop();
}
void createControlGruop( ) {
  bSend = new GButton(this, 345,215,100,35,"Enviar");
  bSend.fireAllEvents(true);

  txfMessage = new GTextField(this,10,215,330,35);
  txfMessage.tag = "txfMessage";
  txfMessage.setPromptText("Escriba aqui perro");

  txa1 = new GTextArea(this, 10, 105, 445, 100,G4P.SCROLLBARS_BOTH);
  txa1.tag = "txa1";
  
}
