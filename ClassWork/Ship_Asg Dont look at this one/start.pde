//decalring my vars
Player P1;
ArrayList<Bullet> bulletList;

void setup() {
  size(800, 800);

  //initialize my vars
  P1 = new Player(400, 700, 50, 50);
  bulletList = new ArrayList<Bullet>();
}

void draw() {
  background(0);
  P1.render();
  P1.move();

  // for loop
  for (Bullet aBullet : bulletList) {
    aBullet.render();
    aBullet.move();
    aBullet.checkRemove();
  }


  //for loop removes bullets
  for (int i = bulletList.size()-1; i> - 0; i -=1) {
  }
}
  void keyPressed() {
    if (key == 'a') {
      P1.isMovingLeft = true;
    }
    if (key == 'd') {
      P1.isMovingRight = true;
    }
    if (key == ' ') {
      bulletList.add(new Bullet(P1.x, P1.y) );
    }
  }

  void keyReleased() {
    if (key == 'a') {
      P1.isMovingLeft = false;
    }
    if (key == 'd') {
      P1.isMovingRight = false;
    }
  }
