// Slavica Coric | april 1 2026| TankGame
Tank t1;
Rock o1;
PImage bg;

void setup() {
  size(500, 500);
  bg = loadImage("bg3.png");
  t1 = new Tank();
  o1 = new Rock(400,100,100,50,5,100);
}


void draw() {
  background(bg);
  t1.display();
  o1.display();
  o1.move();
}

void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if (key == 's') {
       t1.move('s');
    } else if (key == 'a') {
      t1.move('a');
    } else if (key == 'd') {
       t1.move('d');
    }
  }
  
  
