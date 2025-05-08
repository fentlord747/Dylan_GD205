float pacmanX;
float pacmanY;
final int PAC_DIAMETER = 50;
float pacmanAngle;
float pacmanMouth;
PImage apple;
float appleX, appleY;
int score = 0;
boolean appleEaten = false;



void setup () {
  fullScreen();
  //size(500, 500);
  pacmanX = width/2;
  pacmanY = height/2;
  apple = loadImage("Apple.png");
  Apple();
}
void Apple() {
  appleX = random(PAC_DIAMETER, width - PAC_DIAMETER);
  appleY = random(PAC_DIAMETER, height - PAC_DIAMETER);
  appleEaten = false;
}

void draw () {
  background(0);
  PacmanMovement ();
  RotatePacman ();
  mouthAnimation ();
  drawPacman();
  
  if (!appleEaten) {
    image(apple, appleX - 25, appleY - 25, 50, 50); // adjust for image size
  }
  
  Collision();
  
  fill(255);
  textSize(32);
  text("score:" + score, 30, 50);
}

  void Collision() {
  float distance = dist(pacmanX, pacmanY, appleX, appleY);
  if (!appleEaten && distance < PAC_DIAMETER / 2 + 25) { // 25 is half the apple width
    appleEaten = true;
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
