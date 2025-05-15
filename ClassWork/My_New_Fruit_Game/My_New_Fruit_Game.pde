float pacmanX;
float pacmanY;
final int PAC_DIAMETER = 50;
float pacmanAngle;
float pacmanMouth;
PImage apple;
float appleX, appleY;
int score = 0;
boolean appleEat = false;



void setup () {
  fullScreen();
  frameRate(60);
  //size(500, 500);
  
  pacmanX = width/2;
  pacmanY = height/2;
  apple = loadImage("Apple.png");
  Apple();
  
}

void Apple() {
  appleX = random(PAC_DIAMETER, width - PAC_DIAMETER);
  appleY = random(PAC_DIAMETER, height - PAC_DIAMETER);
  appleEat = false;
}

void draw () {
 
  background(0);
  PacmanMovement ();
  RotatePacman ();
  mouthAnimation ();
  drawPacman();
  
  if (!appleEat) {
    image(apple, appleX - 30, appleY - 30, 60, 60); // adjust for image size
    
  }
  
 
  
  fill(255);
  textSize(32);
  text("score:" + score, 0, 20);
  
  fill(255);
  textSize(32);
  text("FPS: " + int(frameRate), width - 100, 25);
  
  
  Collision();
   
}

  void Collision() {
  float distance = dist(pacmanX, pacmanY, appleX, appleY);
  if (!appleEat && distance < PAC_DIAMETER / 2 + 25) { // 25 is half the apple width
    appleEat = true;
    score++;
   Apple();
   
 }
}

void drawPacman () {
  fill(255, 255, 0);
  arc(pacmanX, pacmanY, PAC_DIAMETER, PAC_DIAMETER, pacmanAngle+pacmanMouth/2, pacmanAngle+TWO_PI-pacmanMouth/2, PIE);
  
}

void mouthAnimation () {
  final float PACMAN_MOUTH_SPEED = 0.08;
  final float PACMAN_MAX_MOUTH = 1.5;
  pacmanMouth = (pacmanMouth+PACMAN_MOUTH_SPEED)%PACMAN_MAX_MOUTH;
  
}

void PacmanMovement () {
  int I = 5;
  float xChange = (mouseX-pacmanX)/I;
  float yChange = (mouseY-pacmanY)/I;
  pacmanX = pacmanX + xChange;
  pacmanY = pacmanY + yChange;
  
}

void RotatePacman () {
  pacmanAngle = atan2(mouseY-pacmanY, mouseX-pacmanX);
}



//https://youtu.be/L5cFuGyTWOg?si=ToEIN6OUzqUG77m_
