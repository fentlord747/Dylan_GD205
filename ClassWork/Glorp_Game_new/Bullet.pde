class Bullet {
  //variables
  int x;
  int y;
  int d;
  int speed;
  boolean shouldRemove;
  PImage img;

  //constructor
  Bullet(int startingX, int startingY, PImage bulletImg) {
    x = startingX;
    y = startingY;
    d = 100;
    speed = 10;
    shouldRemove = false;
    img = bulletImg;
  }

  void render() {
    imageMode(CENTER);
    image(img, x, y, d, d);
  }
  void move() {
    y -= speed;
  }

  void checkRemove() {
    if (y < 0) {
      shouldRemove = true;
    }
  }
}
