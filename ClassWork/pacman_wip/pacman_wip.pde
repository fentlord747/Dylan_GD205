float pacmanX;
float pacmanY;
final int PAC_DIAMETER = 50;
float pacmanAngle;
float pacmanMouth;



void setup (){
  fullScreen();
  //size(500, 500);
  pacmanX = width/2;
  pacmanY = height/2;
}


void draw () {
  background(0);
  movePacman ();
  turnPacman ();
  mouthAnimation ();
  drawPacman();
}

void drawPacman (){
  fill(255, 255, 0);
  arc(pacmanX, pacmanY, PAC_DIAMETER,PAC_DIAMETER, pacmanAngle+pacmanMouth/2, pacmanAngle+TWO_PI-pacmanMouth/2, PIE);
}

void mouthAnimation () {
  final float PACMAN_MOUTH_SPEED = 0.08;
  final float PACMAN_MAX_MOUTH = 1.5;
  pacmanMouth = (pacmanMouth+PACMAN_MOUTH_SPEED)%PACMAN_MAX_MOUTH;
}

void movePacman () {
  int I = 5;
  float xChange = (mouseX-pacmanX)/I;
  float yChange = (mouseY-pacmanY)/I;
  pacmanX = pacmanX + xChange;
  pacmanY = pacmanY + yChange;

}

void turnPacman (){
  pacmanAngle = atan2(mouseY-pacmanY,mouseX-pacmanX);
  
}
