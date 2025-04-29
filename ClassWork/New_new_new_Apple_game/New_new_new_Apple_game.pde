//Declaring my vars
Player P1;
int shot;
PImage playerImage; 

//This is where the balls get stored for the ball loop BALLS
ArrayList<Bullet> bulletList;

void setup() {
  frameRate(240);
  //size(800, 600);
  fullScreen();
  noCursor();
  
  
  playerImage = loadImage("Apple.png"); // Load the player  as an my image 
  playerImage.resize(70, 70);           //Resize the image 
  
  
  P1 = new Player(width/2, height/2, playerImage); 

  bulletList = new ArrayList<Bullet>();
}

void draw() {
  background(#1000FF);

  //Crosshair
  if (mouseX < 2000) {
    cursor(CROSS);
  } else {
    cursor(HAND);
  }

  //Shots and score
  textAlign(LEFT, TOP);
  textSize(32);
  fill(255);  
  stroke(0);
  strokeWeight(1);
  text("Shots: " + shot, 10, 10); 
  frameRate(62);
  // FPS Display
  fill(255);
  textSize(16);
  
  // FPS Display cause I really wanted it
  text("FPS: " + int(frameRate), width - 100, 30);
  
  // Renders and move the player
  P1.render();
  P1.move();

  // Bullets
  for (Bullet aBullet : bulletList) {
    aBullet.render();
    aBullet.move();
    aBullet.checkRemove();
  }

  
}

// Movement control
void keyPressed() {
  if (key == 'a') P1.isMovingLeft = true;
  if (key == 'd') P1.isMovingRight = true;
  if (key == 'w') P1.isMovingUp = true;
  if (key == 's') P1.isMovingDown = true;
}

void keyReleased() {
  if (key == 'a') P1.isMovingLeft = false;
  if (key == 'd') P1.isMovingRight = false;
  if (key == 'w') P1.isMovingUp = false;
  if (key == 's') P1.isMovingDown = false;
}

// Shooting bullets
void mousePressed() {
  if (mouseButton == LEFT) {
    bulletList.add(new Bullet(P1.x, P1.y, mouseX, mouseY));
    shot++;
  }
}
