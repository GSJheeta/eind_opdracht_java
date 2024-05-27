PImage img;
PImage finish;
float x = 1300;
float y = 40;
int crashes = 0;
int laps = 0;
String[] woorden = {"rechts", "links", "rechts", "links", "rechts", "links"};

boolean rondjes = false;
boolean cheatGeprint = false;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

boolean naarRechts = false;


void setup() {
  size(1800, 800);
  img = loadImage("racecar3.png");
  finish = loadImage("finishflag.png");
}

void draw() {
  background(0, 160, 0);

  //de racebaan zelf
  fill(100, 100, 100);
  rect(50, 50, 1700, 700);

  //het gras im het midden
  fill(0, 160, 0);
  rect (180, 150, 1440, 500);

  image(img, x, y, 100, 120);
  image(finish, 1300, 50, 150, 120);

  if (rightPressed) {
    x = x+20;
  }
  if (leftPressed) {
    x = x-20;
  }
  if (upPressed) {
    y = y-20;
  }
  if (downPressed) {
    y = y+20;
  }
  
  image(finish, 1300, 50, 150, 120);

  fill(0, 0, 0);
  textSize(20);
  text("Crashes: " + crashes, 0, 20);

  fill(0, 0, 0);
  text("Laps: " + laps, 150, 20);

  if (laps == 3) {
    background(0,255,0);
    textSize(150);
    text("You win!!", 650, 420);
    upPressed = false;
    downPressed = false;
    leftPressed = false;
    rightPressed = false;
  }

  if (y < 1 || y > 680 || x < 30 || x > 1665 || x > 100 && x < 1590 && y > 80 && y < 600 ) {
    y = 40;
    x = 1300;

    crashes = crashes + 1;
    delay(200);
  }
  if ( leftPressed && x == 1320 && y < 100) {
    rondjes = true;

    laps = laps + 1;
  }
  
    if(crashes == 4 && cheatGeprint == false){
    for (String woord : woorden) {
            println(woord);
            cheatGeprint = true;
        }
  }
  
  if(crashes >= 5){
    for(int i = 0; i < 5; i++){
      background(255,0,0);
      textSize(150);
      fill(0);
      text("Game Over", 550, 420);
      delay(100);
    }
  }
}


void keyPressed() {
  if (keyCode == UP) {
    upPressed = true;
  } else if (keyCode == DOWN) {
    downPressed = true;
  } else if (keyCode == LEFT) {
    leftPressed = true;
  } else if (keyCode == RIGHT) {
    rightPressed = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    upPressed = false;
  } else if (keyCode == DOWN) {
    downPressed = false;
  } else if (keyCode == LEFT) {
    leftPressed = false;
  } else if (keyCode == RIGHT) {
    rightPressed = false;
  }
}
