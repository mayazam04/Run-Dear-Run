class Deer {
  
  // variables
  int x;
  int y;
  
  int w;
  int h;
  
  boolean isMovingLeft;
  boolean isMovingRight;
  
  boolean isJumping;
  boolean isFalling;
  
  boolean isDead;
  
  boolean isWon;
  
  int speed;
  
  int jumpHeight; // distance that you can jump upwards
  int highestY; // y value of the top of your jump
  
  int deerLeft;
  int deerBottom;
  int deerRight;
  
  PImage img;
  
  // constructor
  Deer(int startingX, int startingY, int startingW, int startingH){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    isMovingLeft = false;
    isMovingRight = false;
    
    isJumping = false;
    isFalling = false;
    
    isDead = false;
    
    isWon = false;
    
    
    speed = 10;
    
    jumpHeight = 200;
    highestY = y - jumpHeight;
    

  }

  // functions
  void render(){
    rectMode(CENTER);
    rect(x,y,w,h);
  }
  
 void move(){
   if (isMovingLeft == true){
     x -= speed; // x = x - speed;
   }
   
   if (isMovingRight == true){
     x += speed; // x = x + speed;
   }
 }
  
  void jumping(){
    if (isJumping == true){
      y -= speed;
    }
  }
  
  void falling(){
    if(isFalling == true){
      y += speed;
    }
  }
  
  void topOfJump(){
    if( y <= highestY){
      isJumping = false; // stop jumping upward
      isFalling = true; // stop falling downward
      
    }
  }
  
  void land(){
    if ( y > height/2){
      isFalling = false; // stop falling
      y = height/2; // snap player into position where they are standing on bottom of window
    }
  }
  
  void hitbox(){
    deerLeft = x - w/2;
    deerRight = x + w/2;
    deerBottom = y + h/2;
  }
  
  void collision(Enemy aEnemy){
   if(deerLeft <= aEnemy.enemyRight &&
      deerRight >= aEnemy.enemyLeft &&
      deerBottom >= aEnemy.enemyTop){
        isDead = true;
        println("COLLIDED");
  }
  }
  
  
  
  
  
}
