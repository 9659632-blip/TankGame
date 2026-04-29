class PowerUp {
  // Member varaiables
  float x, y, w, h, speed;
  //PImage rock;
  char type;


  //Constructor
  PowerUp() {
    w = 100;
    h = 100;
    speed = 5;



    if (int(random(4))==2) {
      type = 'h';
      x = random (width);
      y = height + 100;
    } else if (int(random(3))==1) {
      type = 't';
      x = random(width);
      y = -100;
    } else if (int(random(3))==2) {
      type = 'a';
      x = random(width);
      y = -100;
    }
  }


  //rock = loadImage("rock.png");


  void display() {
    fill(128);
    if (type =='h') {
      fill(0, 200, 0);
      elipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("health", x, y);
    } else if (type =='t') {
      fill(0, 0, 200);
      elipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Turret", x, y);
    } else if (type =='a') {
      fill(200, 0, 0);
      textAlign(CENTER, CENTER);
      elipse(x, y, w, h);
      fill(255);
      text("Ammo", x, y);
    }


    //imageMode(CENTER);
    //image(rock, x, y);
  }


  //imageMode(CENTER);
  //image(rock, x, y);

  void move() {
    y = y + speed;
  }

  boolean intersect(Projectile p) {
    float distance = dist(x, y, p.x, p.y);
    if (distance < 220) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedEdge() {
    if (x < 0-w/2 || x > width+w/2 || y < 0-w/2 || y> height+w/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Tank t) {
    float distance = dist(x, y, t.x, t.y);
    if (distance < 100) {
      return true;
    } else {
      return false;
    }
  }
}
