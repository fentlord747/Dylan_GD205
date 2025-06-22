class Rlorp {

int x;
int y;
int w;
int h;
int speed; 
PImage img;
  
   
  Rlorp(int startingX, int startingY, int startingW, int startingH) {

    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    img = loadImage("Rlorp.png");

}

void move() {
  y += 5;
  if (y > height) {
  gameOver = true;
  }
}

void render(){

    imageMode(CENTER);           
    image(img, x, y, w, h);  
 
   
  
}
}
