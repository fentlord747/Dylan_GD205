//Its pronouced gif not gif
boolean gameOver = false;
PImage peaImg;
PImage cornImg;
PImage RlorpImg;
PImage GlorpImg;

Player P1;
Rlorp R1;
Glorp G1;

int shot;
//The balls
ArrayList<Bullet> bulletList;

void setup() {
  frameRate(120);
  fullScreen();
  noCursor();
  
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
    background(0);
    fill(255, 231, 32);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Game Ova You Lose", width/2, height/2);
    return;
}
  
  background(0);
  
 
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
  
  if (aBullet.img == peaImg){
    if (dist(aBullet.x, aBullet.y, G1.x, G1.y) < (aBullet.d + G1.w)/2){
      G1.x = int(random(580 + G1.w/2, 1400 - G1.w/2));
      G1.y = -G1.h; // just above the screen
      G1.w = 200;
      G1.h = 200;
    }
  }
  
  if (aBullet.img == cornImg){
    if (dist(aBullet.x, aBullet.y, R1.x, R1.y) < (aBullet.d + R1.w)/2){
      R1.x = int(random(580 + R1.w/2, 1400 - R1.w/2));
      R1.y = -R1.h;
      R1.w = 100;
      R1.h = 100;
    }
  }
}

  for (int i = bulletList.size()-1; i> - 0; i -=1) {
}
//My Lazy wall
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
