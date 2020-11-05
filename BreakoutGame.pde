//Austin Jeon
//Oct 28,2020
//Block 1-1B

//add music

//add sound effects

//add animated gifs


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//mode framework
int mode;
final int intro    = 0;
final int game     = 1;
final int pause    = 2;
final int gameover = 3;

//Gifs
PImage [] gif, gif2;
int frames, frames2;
int f;

//Brick variables and arrays
int [] x;
int [] y;
int brickd;
int n;
int tempx, tempy;
boolean[] alive;

//sound variables
Minim minim;
AudioPlayer introgametheme,wintheme,defeattheme,bouncetheme,scoretheme,balltimertheme;

//paddle & ball (entity) variables
float ballx, bally, balld;//ball
float paddlex, paddley, paddled;//paddle

//keyboard variables
boolean akey,dkey;

//moving
float vballx,vbally;

//text
PFont Lequire;

//colours (https://www.colourlovers.com/palette/490780/The_First_Raindrop)
color frost  = #E8F3F8;
color rain   = #DBE6EC;
color shroud = #C2CBCE;
color border = #A4BCC2;
color sky    = #81A8B8;
color fluid  = #A2E5F6;
color angel  = #208BB9;
color night  = #002846;

//lives, score, timer
int lives;
int timer;
int score;



void setup(){
  size(1200,800,P2D);
  mode = intro;
  
  //defeat gif
  frames = 154;
  gif = new PImage[frames];
  int ii = 0;
  while (ii < frames){
     gif[ii] = loadImage("frame_"+ii+"_delay-0.05s.gif");
    ii = ii + 1;
  }
  
  //victory gif
  frames2 = 34;
  gif2 = new PImage[frames2];
  int iii = 0;
  while (iii < frames2){
     gif2[iii] = loadImage("frame_"+iii+"_delay-0.08s.gif");
    iii = iii + 1;
  }
  
  //bricks and arrays
  brickd = 50;
  n = 27;
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  tempx = 200;
  tempy = 80;
  
  int i = 0;
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
  
  //initialize ball
  ballx = width/2;
  bally = height/2+135;
  balld = 30;
  vballx = 0;
  vbally = 4;
  
  //initialize paddles (maybe move the circles left or right to make it quarter of a circle)
  paddlex = width/2;
  paddley = height+40;
  paddled = 200;
  
  //initialize lives, score and timer
  lives = 3;
  score = 0;
  timer = 100;
   
  //initialize keyboard variables
  akey = dkey = false;
  
  //text
  textAlign(CENTER,CENTER);
  Lequire = createFont("Lequire.otf",200);
  
  //Minim
  minim = new Minim(this);
  introgametheme = minim.loadFile("introgame.mp3");
  wintheme = minim.loadFile("win.mp3"); 
  defeattheme = minim.loadFile("defeat.wav"); 
  bouncetheme = minim.loadFile("bounce.wav");
  scoretheme = minim.loadFile("score.mp3");
  balltimertheme = minim.loadFile("balltimer.mp3");
}

void draw(){
  if (mode == intro){
    intro();
  } else if (mode == game){
    game();
  } else if (mode == pause){
    pause();
  } else if (mode == gameover){
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}
