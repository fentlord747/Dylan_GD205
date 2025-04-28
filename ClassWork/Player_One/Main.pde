//Declaring my vars
Player P1;
int shot;
//This is where the balls get stored for t he loop
ArrayList<Bullet> bulletList;




void setup(){
  frameRate(120);
  fullScreen();
  noCursor();
  P1 = new Player(width/2, height/2, 50, 50);
  bulletList = new ArrayList<Bullet>();

}

void draw(){
//This is my old crosshair
   if (mouseX < 800) {
    cursor(CROSS);
  } else {
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
  
//This is to create the ball loop
for (Bullet aBullet : bulletList){
  aBullet.render();
  aBullet.move();
  aBullet.checkRemove();
  }
for (int i = bulletList.size()-1; i> - 0; i -=1) {
}
}
//This is the movement keys
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
  //}
  //if (key == ' ') {
  // bulletList.add(new Bullet(P1.x, P1.y, mouseX, mouseY));
  //shot++;
}
}
void mousePressed() {
  if (mouseButton == LEFT) {
    bulletList.add(new Bullet(P1.x, P1.y, mouseX, mouseY));
    shot++;
  }
}



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
