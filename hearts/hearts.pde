/*
 * Project: Hearts Valentine's Card
 * Author: Ben Tappin
 * Date: 14th Feburary 2009
 * Summary: A 1 hour project (including image editing)
 *          to make an incredibly geeky Valentine's
 *          card for my girlfriend.
 *
 *          The hearts juggle about, straying, and return
 *          'home' approximately every 12-15 seconds.
 *
 *          Press 's' to save an image.
 */

PImage heart;
Heart[] hearts;

int heartCount = 0;
int MODULUS = 25;

void setup() {
  heart = loadImage("heart_outline.png");
  size(heart.width, heart.height+50);
  background(255);
  frameRate(30);

  for(int x=0; x<heart.width; x++ ) {
    for(int y=0; y<heart.height; y++ ) {

      if( heart.get(x,y) != -1 && x*y % MODULUS == 0) {
        heartCount++;
      }
    }
  }

  hearts = new Heart[heartCount+1];

  int localHeartCount = 0;
  for(int x=0; x<heart.width; x++ ) {
    for(int y=0; y<heart.height; y++ ) {

      if( heart.get(x,y) != -1 && x*y % MODULUS == 0) {
        color c = color( random( 150,255), random(15, 100), random(15,100));
        hearts[localHeartCount] = new Heart(x,y, c);
        localHeartCount++;
      }
    }
  }
}

void draw() {
  background(255);
  for(int i=0; i<heartCount; i++) {
    if(frameCount % (30*12) == 0) {
      hearts[i].sendHome();
    }

    hearts[i].exist();
  }
}


void keyPressed() {
  if( key=='s' || key=='S' ) {
    saveFrame("Hearts-##.png");
  }
}


