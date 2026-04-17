// Slavica Coric | april 1 2026| TankGame
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
Rock o1;
Rock o2;
Rock o3;
PImage bg;
int score;


void setup() {
  size(500, 500);
  score = 0;
  bg = loadImage("bg3.png");
  t1 = new Tank();
  o1 = new Rock(450, 100, 100, 50, 5, 100);
  o2 = new Rock(270, 100, 100, 50, 5, 100);
  o3 = new Rock(150, 100, 100, 50, 5, 100);


  rocks.add(new Rock(300, 200, 100, 100, 100, 200));
}


void draw() {
  background(bg);
  t1.display();
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile part = projectiles.get(i);
    part.display();
  }
  o1.display();
  o1.move();
  o2.display();
  o2.move();
  o3.display();
  o3.move();
  scorePanel();

  for (int i = 0; i < rocks.size(); i++) {
    Rock part = rocks.get(i);
    part.display();
    part.move();
  }
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


void mousePressed() {
  projectiles.add(new Projectile(t1.x, t1.y, 4, 10));
  println(projectiles.size());
}




void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(25);
  text("Score:" + score, width/2, 25);
}
