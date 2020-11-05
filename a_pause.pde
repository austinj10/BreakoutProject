void pause(){
  introgametheme.pause();
  bouncetheme.pause();
  scoretheme.pause();
  balltimertheme.pause();
  
  //text
  fill(frost);
  textFont(Lequire);
  textSize(100);
  text("pause",width/2,height/2-50);
}



void pauseClicks(){
  if (mouseX > 0 && mouseX <  width && mouseY > 0 && mouseY < height){
    mode = game;
  }
}
