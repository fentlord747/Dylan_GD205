class Stalker {
  int x;
  int y;
  int w;
  int h;
  int speed;
   
    Stalk(int startingX, int startingY, int startingW, int startingH) {

    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;

}

void render(){
   rectMode(CENTER);
   rect(x, y, w, h);
 
   
  
}
}

