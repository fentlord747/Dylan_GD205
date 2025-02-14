class Player {
 
  
  //My variables
  int x;
  int y;
  int w;
  int h;
  int speed;
  
  boolean isMovingLeft;
  boolean isMovingRight;
  
  
  //My construster
    Player(int startingX, int startingY, int startingW, int startingH){
    
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    isMovingLeft = false;
    isMovingRight = false;
    
    speed = 10;
   
  }
void render(){
   rect(x,y,w,h);
  
  }


void move(){
  if (isMovingLeft == true){
    x -= speed; //x= x - speed
  }
  
  if (isMovingRight == true){
    x += speed;
  }
}
}
