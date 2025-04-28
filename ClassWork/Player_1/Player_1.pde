class Player{
  
//These are my variables for the player

int x;
int y; 
int w;
int h;
int speed;

boolean isMovingLeft;
boolean isMovingRight;
boolean isMovingUp;
boolean isMovingDown;

//These will be my constuctors 

Player(int startingX, int startingY, int startingW, int startingH){

x = startingX;
y = startingY;
w = startingW;
h = startingH;

isMovingLeft = false;
isMovingRight = false;
isMovingUp = false;
isMovingDown = false;

speed = 10;

}

//I will use render to render my player out

void render(){
  pushMatrix();
  rectMode(CENTER);
  rect(x,y,w,h);
  popMatrix();
 
}

//This is for the movment of my player

void move(){
  if(isMovingLeft == true){
    x -= speed;
}
  if(isMovingRight == true){
    x += speed;
}
    if(isMovingUp == true){
    y -= speed;
}
  if(isMovingDown == true){
    y += speed;
}
  
  x = constrain(x, w/2, width - w/2);
  y = constrain(y, h/2, height - h/2);
  
  //My old constrain
  //x = constrain(x, 25, 825 - this.w); 
  //y = constrain(y, 25, 825 - this.h);
 
}
}
