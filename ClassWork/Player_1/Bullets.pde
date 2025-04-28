class Bullet{
//Old Variables 
//int x;
//int y; 

// These Are My Variables For The Bullets
PVector pos;
PVector vel;
int d;
int speed;
boolean shouldRemove;

//The constustor for my bullets
  Bullet(float startX, float startY, float targetX, float targetY) {
  pos = new PVector(startX, startY);
  
PVector dir = new PVector(targetX - startX, targetY - startY);
  dir.normalize(); // Make it unit length
  dir.mult(10);    // Set speed
//This is the velocity of the bullet and direaction 
  vel = dir;
//This is the diamter for the bullet
  d = 15;
//This is the check to see if the balls are in bounds
  shouldRemove = false;
  
}

void render(){
  circle(pos.x, pos.y, d);
}
void move(){
  pos.add(vel);
  
}
void checkRemove() {
  if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
  shouldRemove = true;
    }
  }
}







//This is my code to check if my bullets are out of bound
//void checkRemove(){
//  if (y < 0){
//    shouldRemove = true;
//   }
//  if (y < 800){
//    shouldRemove = true;
//   }
//   if (x < 0){
//    shouldRemove = true;
//    if (x < 800){
//    shouldRemove = true;
//   }
//   }
// }
//}
 
