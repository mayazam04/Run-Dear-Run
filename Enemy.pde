class Enemy{
  
  // variables
  int x;
  int y;
  
  int w;
  int h;
  
  boolean isZooming;
  
  int speed;
  
  int id;// id=0 -> car,  id=1 -> person, id=2 -> bike
  
  int enemyLeft;
  int enemyTop;
  int enemyRight;
  
  PImage img;
  
  // constructor
  Enemy(int startingX, int startingY, int startingW, int startingH, PImage anImg){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    isZooming = false;
    
    speed = 10;
    
    img = anImg;
    
    id = int(random(0,4));
  }
  
  // functions
  void render(){
    imageMode(CENTER);
    //rect(x,y,w,h);
    image(img,x,y,w,h);
  }
  
 void moving(){
   //if ( isZooming == true){
     x -= speed; // x =  x - sped"
   //}
 }
 
 void hitbox(){
    enemyLeft = x - w/2;
    enemyRight = x + w/2;
    enemyTop = y - h/2;
  }
 
}
