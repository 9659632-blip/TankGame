class PowerUp {
  // Member varaiables
  float x, y, w, h, speed;
  //PImage rock;
  char type;


  //Constructor
  PowerUp(float w, float h) {
    this.w = w;
    this.h = h;
    speed = 5;
    if (int(random(4))==2) {
      type = 'w';
      x = random (width);
      y = height + 100;
      type = 'd';
    }
  }
}

//rock = loadImage("rock.png");


void display() {
  fill(128);
  if (type =='h') {
    fill(0, 200, 0);
    elipse(x, y, w, h);
    fill(2555);
    text("health", x, y);
  } else if (type =='t') {
    fill(0, 0, 200);
    elipse(x, y, w, h);
    fill(255);
    text("Turret", x, y);
  } else if (type =='a') {
    fill(200, 0, 0);
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
  //x=x+speed;
  //if (x>width) {
  //  x = 0;
}

boolean intersect(Projectile p) {
  float distance = dist(x, y, p.x, p.y);
  if (distance < 220) {
    return true;
  } else {
    return false;
  }
}

boolean reachedSide() {
  if (x < 0-w/2 || x > width+w/2 || y < 0-w/2 || y> height+w/2) {
    return true;
  } else {
    return false;
  }
}
}
