class Glorp {

int x;
int y;
int w;
int h;
int speed; 
PImage img;
  
   
  Glorp(int startingX, int startingY, int startingW, int startingH) {

    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;

    img = loadImage("Glorp.png");
    
}

void move() {
  y += 3;
  if (y > height) {
  gameOver = true;
  }
}

void render(){
    
    imageMode(CENTER);           
    image(img, x, y, w, h);  
 
   
  
}
}
