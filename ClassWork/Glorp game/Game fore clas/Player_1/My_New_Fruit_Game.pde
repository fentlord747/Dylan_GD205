//Declaring my vars
Player P1;
int shot;
//The bal
ArrayList<Bullet> bulletList;

void setup() {
  frameRate(120);
  fullScreen();
  noCursor();
  //Players postion at the start
  P1 = new Player(width/2, height/1, 50, 50);
  bulletList = new ArrayList<Bullet>();
}

void draw() {
 
  //This is for my score
  background(0);
  
  textSize(250);
  stroke(0, 50, 255);
  text(shot, 0, 0);
  P1.render();
  P1.move();

  //This is to create the ball loop and to check if its in or out of bounds
  for (Bullet aBullet : bulletList) {
    aBullet.render();
    aBullet.move();
    aBullet.checkRemove();
  }

  for (int i = bulletList.size()-1; i> - 0; i -=1) {
}
 
}
//Check If THe Key Is Pressed
void keyPressed() {
  
  if (key == 'a') {
    P1.isMovingLeft = true;
  }
  if (key == 'd') {
    P1.isMovingRight = true;
  }
  if (key == 'w') {
    P1.isMovingUp = true;
  }
  if (key == 's') {
    P1.isMovingDown = true;
  }
  if (key == ' ') {
  bulletList.add(new Bullet(P1.x, P1.y));
    shot++;
  }
}

//Check If The Key Is Released
void  keyReleased() {
  if (key == 'a') {
    P1.isMovingLeft = false;
  }
  if (key == 'd') {
    P1.isMovingRight = false;
  }
  if (key == 'w') {
    P1.isMovingUp = false;
  }
  if (key == 's') {
    P1.isMovingDown = false;
  }
}
