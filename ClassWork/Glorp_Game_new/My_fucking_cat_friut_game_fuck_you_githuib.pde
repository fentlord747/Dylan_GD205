//Its pronouced gif not gif
boolean gameOver = false;
PImage peaImg;
PImage cornImg;
PImage RlorpImg;
PImage GlorpImg;
int shot;
int timerStart;
//The balls
ArrayList<Bullet> bulletList;
Player P1;
Rlorp R1;
Glorp G1;





void setup() {
  frameRate(120);
  fullScreen();
  noCursor();
  timerStart = millis();
  
   peaImg = loadImage("Pea.png");
   cornImg = loadImage("Corn.png");
   
   
  //Postion of everthing at the start
  P1 = new Player(width/2, height/1, 50, 50);
  R1 = new Rlorp(int(random(580 + 50, 1400 - 50)), -100, 100, 100);
  G1 = new Glorp(int(random(580 + 100, 1400 - 100)), -200, 200, 200);
  
  bulletList = new ArrayList<Bullet>();
}

  
  
void draw() {

if (gameOver) {
  //Game over
    background(0);
    fill(255, 231, 32);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Game Ova You Lose", width/2, height/2);
    return;
}
  
  background(0);
  
 //Just makes sure i can render and move 
  P1.render();
  P1.move();
  
  G1.move();
  G1.render();

  R1.move();
  R1.render();



//Checks if my balls 0w0 are off or on screen
                    
for (Bullet aBullet : bulletList){
  aBullet.render();
  aBullet.move();
  aBullet.checkRemove();
  
if (aBullet.img == peaImg) { //this keeps track of the ditanmce of the bullet and the glorp or rlorp they both work the same
  float distance = dist(aBullet.x, aBullet.y, G1.x, G1.y);
  float totalSize = aBullet.d + G1.w;
  
  if (distance < totalSize / 2) {//Makes them spawn up at the top randomly
    G1.x = int(random(580 + G1.w/2, 1400 - G1.w/2));
    G1.y = -G1.h;
    //makes sure that my enemy size stays the same based on my pref
    G1.w = 200;
    G1.h = 200;
  }
}

if (aBullet.img == cornImg) {
  float distance = dist(aBullet.x, aBullet.y, R1.x, R1.y);
  float totalSize = aBullet.d + R1.w;
  
  if (distance < totalSize / 2) {
    R1.x = int(random(580 + R1.w/2, 1400 - R1.w/2));
    R1.y = -R1.h;
    
    R1.w = 100;
    R1.h = 100;
  }//I hate this stuff ima forget it all later watch
}
}

  for (int i = bulletList.size()-1; i> - 0; i -=1) {
}
//My Lazy ah wall Ik it can be done better
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
fill(255);


} 
//My timer like i wanted
textSize(30);
text("Glorp secounds:" + (millis() - timerStart) / 1000 + "s", 50, 50);

  
}
 

//Key press check
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
  bulletList.add(new Bullet(P1.x, P1.y, peaImg));//Pea 
  shot++;
  }
   if (key == 'h') {
    bulletList.add(new Bullet(P1.x, P1.y, cornImg));//Corn
    shot++;
  }
}

//Key releas check
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
