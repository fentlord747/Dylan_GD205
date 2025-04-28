//Declaring my vars
Player P1;
int shot;
//This is where the balls get stored for the  ball loop
ArrayList<Bullet> bulletList;

void setup(){
  frameRate(240);
  fullScreen();
  noCursor();
//This code make the playr start in the center
  P1 = new Player(width/2, height/2, 50, 50);
  bulletList = new ArrayList<Bullet>();
}

void draw(){
//This is my  crosshair basic rigth now but I plan to fix
  if (mouseX < 800) {
    cursor(CROSS);
} 
  else {
    cursor(HAND); 
}
  
//This is for my score
  background(0);
  textAlign(CENTER);
  textSize(250);
  stroke(0,50,255);
  text(shot,400,400);
  frameRate(60);
  P1.render();
  P1.move();
  
//This is to create the ball loop and to check if its in or out of bounds
for (Bullet aBullet : bulletList){
  aBullet.render();
  aBullet.move();
  aBullet.checkRemove();
}

for (int i = bulletList.size()-1; i> - 0; i -=1) {

}

//This adds a frame counter  I really wanted it for some reason 
  fill(255);        
  textSize(16);     
  text("FPS: " + int(frameRate), width - 100, 30);  
}
//Check If THe Key Is Pressed 
void keyPressed(){
  if (key == 'a'){
    P1.isMovingLeft = true;
}
  if (key == 'd'){
    P1.isMovingRight = true;
}
  if (key == 'w'){
   P1.isMovingUp = true;
}
  if (key == 's') {
    P1.isMovingDown = true;
    
  //} Old Shoot Button 
  //if (key == ' ') {
  // bulletList.add(new Bullet(P1.x, P1.y, mouseX, mouseY));
  //shot++;
}
}
//New Button To Shoot
void mousePressed() {
  if (mouseButton == LEFT) {
    bulletList.add(new Bullet(P1.x, P1.y, mouseX, mouseY));
    shot++;
  }
}


//Check If The Key Is Released
void  keyReleased(){
  if (key == 'a'){
    P1.isMovingLeft = false;
}
  if (key == 'd'){
    P1.isMovingRight = false;
}
  if (key == 'w'){
   P1.isMovingUp = false;
}
  if (key == 's') {
    P1.isMovingDown = false;
    }
 }
