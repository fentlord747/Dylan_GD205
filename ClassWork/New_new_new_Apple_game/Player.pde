class Player {
  int x, y;
  int speed;
  boolean isMovingLeft, isMovingRight, isMovingUp, isMovingDown;
  PImage sprite;

  Player(int startX, int startY, PImage img) {
    x = startX;
    y = startY;
    sprite = img;
    speed = 11;

    isMovingLeft = false;
    isMovingRight = false;
    isMovingUp = false;
    isMovingDown = false;
  }

  void render() {
    imageMode(CENTER);
    image(sprite, x, y); // Draw the PNG sprite centered
  }

  void move() {
    if (isMovingLeft) x -= speed;
    if (isMovingRight) x += speed;
    if (isMovingUp) y -= speed;
    if (isMovingDown) y += speed;

    // Keep player in bounds
    x = constrain(x, sprite.width / 2, width - sprite.width / 2);
    y = constrain(y, sprite.height / 2, height - sprite.height / 2);
  }
}
