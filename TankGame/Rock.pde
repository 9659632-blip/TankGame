class Rock {
  // Member varaiables
  float x, y, w, h, speed, health;
  PImage rock;
  char idir;


  //Constructor
  Rock(float x, float y, float w, float h, float speed, float health) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;
    if (int(random(4))==2) {
      idir = 'w';
      x = random (width);
      y = height + 100;
      idir = 'd';
    }


    rock = loadImage("rock.png");
  }

  void display() {
    fill(128);
    imageMode(CENTER);
    image(rock, x, y);
  }

  void move() {
    x=x+speed;
    if (x>width) {
      x = 0;
    }
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
