void gameover(){
  introgametheme.pause();
  bouncetheme.pause();
  scoretheme.pause();
  balltimertheme.pause();
  background(night);
  
  if (lives == 0){
  defeattheme.play();
  //you suck gif
  image(gif[f],0,0,width,height);
  f = f + 1;
  if(frameCount % 100 == 0) f = f + 1;
  if (f == frames) f = 0;
  } 
  
  
  if (score == 27){
  wintheme.play();
  //victory gif
  image(gif2[f],0,0,width,height);
  f = f + 1;
  println(frameCount);
  if(frameCount % 100000 == 0) f = f + 1;
  if (f == frames2) f = 0;
  //you win text
  fill(night);
  textFont(Lequire);
  textSize(150);
  text("you win!",width/2,200);
  } 
}



void gameoverClicks(){ 
  reset();
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height){
    mode = intro;
  }
}

void reset(){
  paddlex = width/2;
  lives = 3;
  vballx = 0;
  vbally = 5;
  timer = 100;
  score = 0;
  ballx = width/2;
  bally = height/2+135;
  
  int i = 0;
  tempx = 200;
  tempy = 80;
  while(i < n){
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 200;
    if (tempx == width){ 
      tempy = tempy + 100;
      tempx = 100;
    } else if (tempx == 1300){
      tempx = 200;
      tempy = tempy + 100;
    }
    i = i + 1;
   }
}
