//Declaring my vars
PImage peaImg;
PImage cornImg;

Stalk S1;
Player P1;
int shot;
//The bal
ArrayList<Bullet> bulletList;

void setup() {
  frameRate(120);
  fullScreen();
  noCursor();
  
   peaImg = loadImage("Pea.png");
   cornImg = loadImage("Corn.png");
   
  //Players postion at the start
  P1 = new Player(width/2, height/1, 50, 50);
  bulletList = new ArrayList<Bullet>();
  S1 = new Stalk(width/2, height/2, 50, 50);
}

  
  
void draw() {

  //This is for my score
  
  background(0);
  
  //textSize(250);
  //stroke(0, 50, 255);
  //text(shot, 0, 0);
 
  P1.render();
  P1.move();
  
  S1.render();

  //This is to create the ball loop and to check if its in or out of bounds
  for (Bullet aBullet : bulletList) {
    aBullet.render();
    aBullet.move();
    aBullet.checkRemove();
  }

  for (int i = bulletList.size()-1; i> - 0; i -=1) {
}
{
beginShape();
 fill(#4382C4);
vertex(0,0);
vertex(580,0);
vertex(580,1080);
vertex(0,1080);
endShape(CLOSE);

beginShape();
 fill(#4382C4);
vertex(1400,0); 
vertex(1980,0);
vertex(1980,1080);
vertex(1400,1080);
endShape(CLOSE);
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
  if (key == 'g') {
  bulletList.add(new Bullet(P1.x, P1.y, peaImg));
  shot++;
  }
   if (key == 'h') {
    bulletList.add(new Bullet(P1.x, P1.y, cornImg)); // Shoot corn
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
