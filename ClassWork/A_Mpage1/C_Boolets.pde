class Bullet{

// These are my variables for the bullets
int x;
int y; 
int d;
int speed;
boolean shouldRemove;

//The constustor for my bullets
Bullet(int startingX, int startingY){
  
  x = startingX;
  y = startingY;
 
 //This is the diamter for my bullet
 d = 15;

//This the projectile speed
 speed = 15;
 
//This is the check to see if the balls are out of bounds
  shouldRemove = false;
  
}

void render(){
  circle(x,y,d);
}
void move(){
  y -= speed;
  
}
void checkRemove(){
  if (y < 0){
    shouldRemove = true;
   }
 }
}
 
