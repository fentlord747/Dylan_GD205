
class Player {

  //These are my variables for the player
  int x;
  int y;
  int w;
  int h;
  int speed;

  boolean isMovingLeft;
  boolean isMovingRight;
  boolean isMovingUp;
  boolean isMovingDown;

  //These will be my constuctors

  Player(int startingX, int startingY, int startingW, int startingH) {

    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;

    isMovingLeft = false;
    isMovingRight = false;
    isMovingUp = false;
    isMovingDown = false;

    speed = 5;
  }

  //I will use render to render my player out

  void render() {
   
    pushMatrix();
    fill(#FFFFFF);
    rectMode(CENTER);
    rect(x, y, w, h);
    popMatrix();
    
  }

  //This is for the movment of my player

  void move() {
    if (isMovingLeft == true) {
      x -= speed;
    }
    if (isMovingRight == true) {
      x += speed;
    }
    if (isMovingUp == true) {
      y -= speed;
    }
    if (isMovingDown == true) {
      y += speed;
    }

    //x = constrain(x, w/2, width - w/2);
    //y = constrain(y, h/2, height - h/2);



  x = constrain(x, 580 + w / 2, 1400 - w / 2);
  y = constrain(y, h / 2, height - h / 2);
  
  }
}
