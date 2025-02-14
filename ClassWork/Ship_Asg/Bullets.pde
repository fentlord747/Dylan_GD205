class Bullet {
  //variables
   int x;
   int y;
   int d;
   int speed;
   boolean shouldRemove;
   
   //constructor
   Bullet(int startingX, int startingY){
     x = startingX;
     y = startingY;
     
     d = 20;
     
     speed =15;
     
     shouldRemove = false;
     
   }
   
   void render(){
    circle(x,y,d);
     
     
   }
   void move(){
     y -= speed;
   }
   
   void checkRemove(){
     if (y < 0){
       shouldRemove = true;
   }
}
}
