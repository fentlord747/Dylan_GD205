class Bullet {
  //Old Variables
  //int x;
  //int y;

  // These Are My Variables For The Bullets
  PVector pos;
  PVector vel;
  int d;
  int speed;
  boolean shouldRemove;

  //The constustor for my bullets
  Bullet(float startX, float startY, float targetX, float targetY) {
    pos = new PVector(startX, startY);

    PVector dir = new PVector(targetX - startX, targetY - startY);
    dir.normalize(); // I forgur
    dir.mult(25);    // This Sets speed Of My Balls ToT
    //This is the velocity of my bullet and direaction of my Balls :)
    vel = dir;
    //This is the diamter of my BALLS WuW
    d = 15;
    //This is the check to see if my balls are in bounds UwU
    shouldRemove = false;
  }

  void render() {
    circle(pos.x, pos.y, d);
  }
  void move() {
    pos.add(vel);
  }
  void checkRemove() {
    if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
      shouldRemove = true;
    }
  }
}
