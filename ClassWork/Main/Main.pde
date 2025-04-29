// Declaring my vars
Player P1;
int shot;

// This is where the balls get stored for the ball loop
ArrayList<Bullet> bulletList;

// Variables for sprite sheet animation
PImage appleSpriteSheet; //NEW CHANGE: Variable to hold the sprite sheet
PImage[] appleFrames;    //NEW CHANGE: Array to store individual frames
int currentFrame = 0;    //NEW CHANGE: Frame counter for animation

void setup() {
  // Start of void setup
  frameRate(240);
  size(800, 600);
  noCursor();

  //NEW CHANGE: Load the apple sprite sheet and create individual frames
  appleSpriteSheet = loadImage("Apple.png"); // Make sure this is in the data folder
  appleFrames = new PImage[6]; // Assuming 6 columns in the sprite sheet
  int frameWidth = appleSpriteSheet.width / 6; // Width of each frame (assuming 6 columns)
  int frameHeight = appleSpriteSheet.height; // Height of the frame (single row)

  //NEW CHANGE: Extract each frame from the sprite sheet
  for (int i = 0; i < 6; i++) {
    appleFrames[i] = appleSpriteSheet.get(i * frameWidth, 0, frameWidth, frameHeight);
  }

  // Initialize player (using the apple sprite for the player)
  P1 = new Player(width / 2, height / 2, frameWidth, frameHeight);  // Use frameWidth and frameHeight for player size

  // Initialize the bullet list
  bulletList = new ArrayList<Bullet>();
}

void draw() {
  // Start of void draw
  
  // This is my crosshair, basic right now but I plan to fix
  if (mouseX < 800) {
    cursor(CROSS);
  } else {
    cursor(HAND);
  }

  // This is for my score
  background(0);
  textAlign(CENTER);
  textSize(250);
  stroke(0, 50, 255);
  text(shot, 400, 400);

  frameRate(60);
  
  //NEW CHANGE: Update and render the player (apple sprite)
  P1.render();
  P1.move();

  //NEW CHANGE: Animation logic for the Apple sprite (moving through frames)
  currentFrame = (currentFrame + 1) % 6; // Cycle through frames (6 frames in total)

  // This is to create the bullet loop and check if it's in or out of bounds
  for (Bullet aBullet : bulletList) {
    aBullet.render();
    aBullet.move();
    aBullet.checkRemove();
  }

  // FPS Counter
  fill(255);
  textSize(16);
  text("FPS: " + int(frameRate), width - 100, 30);
}

// Check to see if the key is being pressed
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
}

// New Button To Shoot
void mousePressed() {
  if (mouseButton == LEFT) {
    bulletList.add(new Bullet(P1.x, P1.y, mouseX, mouseY));
    shot++;
}

// Check if the key is released
void keyReleased() {
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
