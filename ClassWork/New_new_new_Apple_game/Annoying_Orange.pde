float x, y;
float speed;
PImage sprite;


class Orange {
  

  Orange(float startX, float startY, PImage img) {
    x = startX;
    y = startY;
    sprite = img;
    speed = 10; 
  }

  void Follow(float targetX, float targetY) {
    PVector direction = new PVector(targetX - x, targetY - y);
    direction.normalize();
    direction.mult(speed);

    x += direction.x;
    y += direction.y;
  }

  void render() {
    imageMode(CENTER);
    image(sprite, x, y);
  }
}
