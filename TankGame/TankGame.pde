// Slavica Coric | april 1 2026| TankGame
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
Rock o1;
Rock o2;
Rock o3;
PImage bg;
int score;
Timer objTimer, puTimer;



void setup() {
  size(500, 500);
  score = 0;
  bg = loadImage("bg3.png");
  t1 = new Tank();
  // o1 = new Rock(450, 100, 100, 50, 5, 100);
  //o2 = new Rock(270, 100, 100, 50, 5, 100);
  //o3 = new Rock(150, 100, 100, 50, 5, 100);
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  //rocks.add(new Rock(300, 200, 100, 100, 100, 200));
}


void draw() {
  background(bg);
  t1.display();
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile part = projectiles.get(i);
    part.move();
    part.display();
  }

  scorePanel();


  //distribute objects on timer†
  if (objTimer.isFinished()) {
    //Add object
    rocks.add(new Rock(300, 200, 100, 100, 5, 200));
    //restart timer
    objTimer.start();
  }

  if (puTimer.isFinished()) {
    //Add powerup
    powerups.add(new PowerUp());
    //restart timer
    puTimer.start();
  }


  // displays and moves owbstacles
  //Render and detect collision
  for (int i = 0; i < rocks.size(); i++) {
    Rock o = rocks.get(i);
    for (int j = 0; j < projectiles.size(); j++) {
      Projectile p = projectiles.get(j);
      if (p.intersect(o)) {
        score = score + 100;
        projectiles.remove(j);
        rocks.remove(o);
        i--;
        j--;
        continue;
      }
      //detect collisions to tank
      //impact to change score, health and obstacle
      if (t1.intersect(o)) {
        score = score - 100;
      }
      if (p.reachedEdge()) {
        projectiles.remove(i);
        i--;
        continue;
      }
    }
  }
  // o.display();
  // o.move();
  //distribute PowerUps on timer†

  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    if (pu.reachedEdge()) {
      powerups.remove(pu);
    }
    if (pu.intersect(t1)) {
      // Turret
      if (pu.type == 't') {
        t1.turretCount++;
      } else  if (pu.type == 'a') {
        t1.laserCount = t1.laserCount + 100;
      } else  if (pu.type == 'h') {
        t1.health = t1.health + 10;
      }
    }
  }






    for (int j = 0; j < projectiles.size(); i++) {
      Projectile p = projectiles.get(i);
      for (int j = 0; j < obstacles.size(); j++ {
        Obstacle o = obstacles.get(j)
      if (p.intersect(o)) {
        score = score + 100;
        pprojectiles.remove(i);
        obstacles.remove(j);

        continue;
      }
      //detect collisions to tank
      //impact to change score, health and obstacle
      if (t1.intersect(o)) {
        score = score - 100;
      }
      if (p.reachedEdge()) {
        powerups.remove(i);
        i--;
        continue;
      }
    }
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
  float dx = mouseX - t1.x;
  float dy = mouseY - t1.y;
  float mag = sqrt(dx*dx + dy*dy);

  if (mag > 0) {
    dx /= mag;
    dy /= mag;

    float speed = 5;
    if (t1.turretCount == 1 && t1.laserCount > 0) {
      projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
      t1.laserCount = t1.laserCount - 1;
    } else  if (t1.turretCount == 2) {
      projectiles.add(new Projectile(t1.x-20, t1.y+20, dx * speed, dy * speed));
      projectiles.add(new Projectile(t1.x +20, t1.y-20, dx * speed, dy * speed));
      t1.laserCount = t1.laserCount - 2;
    }
  }
}


void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(25);
  text("Score:" + score, width/2, 25);
  text("Health:" + t1.health, width/2-150, 25);
  text("Ammo:" + t1.laserCount, width/2+150, 25);
}
