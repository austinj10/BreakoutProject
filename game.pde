void game(){
  introgametheme.play();
  background(sky);
  
  //text lives
  fill(frost);
  textFont(Lequire);
  textSize(75);
  text(lives, width-50,height-50);
   
  //lives and restart
  if (bally > height+25){
    lives--;
    ballx = width/2;
    bally = height/2+135;
    vballx = 0;
    vbally = 4;
    timer = 100;
    balltimertheme.rewind();
    balltimertheme.play();
  }
  if (lives == 0){
    mode = gameover;
  }
 
  //score
  fill(frost);
  textFont(Lequire);
  textSize(75);
  text(score,50,height-50);
  if (score == 27){
    mode = gameover;
  }
 
  //timer 
  timer = timer - 1;
  
  //paddle
  strokeWeight(0);
  fill(border);
  circle(paddlex,paddley,paddled);
  
  //move paddle
   if (akey == true) paddlex = paddlex - 8.5;
    if (paddlex < 100) akey = false;
  if (dkey == true) paddlex = paddlex + 8.5;
    if (paddlex > width-100) dkey = false;
    
  //bounce paddles
  if (dist(paddlex,paddley,ballx,bally) <= paddled/2 + balld/2){
    vballx = (ballx - paddlex)/12;
    vbally = (bally - paddley)/12;
    bouncetheme.rewind();
    bouncetheme.play();
  }
    
  //ball 
  fill(frost);
  circle(ballx,bally,balld);
  
  //ball moving
  if (timer < 0){
    ballx = ballx + vballx;
    bally = bally + vbally;
  }
  
  //bounce walls
  if (bally < 15){
    vbally = vbally * -1;
    bouncetheme.rewind();
    bouncetheme.play();
  } else if (ballx < 15 || ballx > width-15){
    vballx = vballx * -1;
    bouncetheme.rewind();
    bouncetheme.play();
  }
  
  //bricks
  int i = 0;
  while (i < n){
    if (alive[i] == true){
    manageBrick(i);
    } i = i + 1; 
  }
}



void gameClicks(){
   if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height){
    mode = pause;
  }
}



void manageBrick(int i){
  //colour
  if (y[i] == 80){
   fill(0); 
  } else if (y[i] == 180){
   fill(95);
  } else if (y[i] == 280){
   fill(140);
  } else if (y[i] == 380){
   fill(210);
  } else if (y[i] == 480){
   fill(255);
  }
  strokeWeight(0);
  circle(x[i],y[i], brickd);
  
  //collision
  if (dist(x[i],y[i],ballx,bally) <= brickd/2 + balld/2){
   vballx = (ballx - x[i])/4;
   vbally = (bally - y[i])/4;
   alive[i] = false;
   score++;
   scoretheme.rewind();
   scoretheme.play();
   }  
}
