
import processing.sound.*;

// declare my sound vars
SoundFile nature;

// declaring my vars
Deer p1;
Enemy e1;


// starting state
int state = 0;

//enemy array list
ArrayList<Enemy> enemyList;

int startTime;
int endTime;
int interval;

int sTime;
int eTime;
int inTerval;

PImage img1;
PImage img2;
PImage img3;

Animation deerAnimation;
PImage [] deerImages = new PImage[2];

boolean m;

void setup() {
  size(1200, 800);

  imageMode(CENTER);


  // loop to fill my array
  for (int index=0; index < 2; index++) {
    deerImages[index] = loadImage("deerJump" + index + ".png");

    deerAnimation = new Animation(deerImages, 0.1, 0.3);
  }

  // intializing my vars
  p1 = new Deer(width/2, height/2, 50, 50);
  //e1 = new Enemy(width, height/2, 50, 50);

  img1 = loadImage("Img1.png");
  img2 = loadImage("img2.png");
  img3 = loadImage("Img3.png");

  enemyList = new ArrayList<Enemy>();

  startTime = millis();

  interval = 5000;

  inTerval = 10000;

  // intialize my sound vars
  nature = new SoundFile(this, "woods.mp3");



  //
}

void draw() {
  background(255);

  if (nature.isPlaying() == false) {
    nature.play();
  }


  endTime = millis();

  if (endTime - startTime > interval) {
    println("ENEMY SPAWNED");
    PImage i = randomizeImage();
    Enemy newEnemy = new Enemy(width, height/2, 150, 150, i);
    if (state == 2) {
      newEnemy.speed = 15;
    }
    enemyList.add(newEnemy);
    startTime = millis();
  }



  // states of game
  switch(state) {
    // first state
  case 0:
    background(42);
    textSize(80);
    textAlign(CENTER);
    text("Press space to Start", width/2, height/2);
    break;

    //level 1
  case 1:
    background(255);
    textSize(80);
    fill(0);
    textAlign(CENTER);
    text("Level 1", width/2, height/8);
    p1.render();
    p1.move();
    p1.jumping();
    p1.falling();
    p1.topOfJump();
    p1.land();
    p1.hitbox();
    //p1.collision(e1);

    deerAnimation.display(p1.x, p1.y-30);
    deerAnimation.isAnimating = true;


    eTime = millis();

    if (eTime - sTime > inTerval) {
      println("Level 2");
      state = 2;
      sTime = millis();
    }

    if (p1.isDead) {
      state = 3;
    }

    for (Enemy anEnemy : enemyList) {
      anEnemy.render();
      anEnemy.moving();
      anEnemy.hitbox();
      p1.collision(anEnemy);
    }

    //e1.render();
    //e1.moving();
    //e1.hitbox();

    //e2.render();
    //e2.moving();
    break;

    // level 2
  case 2:
    background(255);
    textSize(80);
    textAlign(CENTER);
    text("Level 2", width/2, height/8);

    p1.render();
    p1.move();
    p1.jumping();
    p1.falling();
    p1.topOfJump();
    p1.land();

    if (p1.isDead) {
      state = 3;
    }


    for (Enemy anEnemy : enemyList) {
      anEnemy.render();
      anEnemy.moving();
      anEnemy.hitbox();
      p1.collision(anEnemy);
    }

    deerAnimation.display(p1.x, p1.y-30);
    deerAnimation.isAnimating = true;


    eTime = millis();

    if (eTime - sTime > inTerval) {
      state = 4;
      sTime = millis();
    }


    break;

  case 3:
    background(42);
    textSize(130);
    fill(255);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2); 
    textSize(60);
    text("Press 'space' to try again", width/2, height/2 + height/4);
    break;

  case 4:
    background(42);
    textSize(130);
    fill(255);
    textAlign(CENTER);
    text("YOU WIN", width/2, height/2);
    break;
  }
}


void keyPressed() {
  // space = start game
  if (key == ' ') {
    state = 1;
    gameReset();
    nature.stop();
    nature.play();
  }

  // a = moving left
  if (key == 'a') {
    p1.isMovingLeft = true;
  }

  // d = moving right
  if (key == 'd') {
    p1.isMovingRight = true;
  }

  // w = jumping
  if (key == 'w' && p1.isJumping == false && p1.isFalling == false) {
    p1.isJumping = true; // start a new jump
    p1.highestY = p1.y - p1.jumpHeight;
  }
}

void keyReleased() {
  // stop moving left
  if (key == 'a') {
    p1.isMovingLeft = false;
  }
  // stop moving right
  if (key == 'd') {
    p1.isMovingRight = false;
  }
}

PImage randomizeImage() {
  int n = int(random(1, 4));
  if (n==1) {
    return img1;
  } else if (n==2) {
    return img2;
  } else {
    return img3;
  }
}

void gameReset() {
  enemyList.clear();
  p1.isDead = false;
  state = 1;
}



void levelTwo() {
  state = 2;
}
