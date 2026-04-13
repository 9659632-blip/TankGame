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
    idir = 'w';
    rock = loadImage("rock.png");
    //if(idir == 'w'){
    //  rock = loadImage("rock.png");
    //}
    //else if (type == "crate"){
    //  rock = loadImage("crate.png");
    //}
  }

  void display() {
    fill(128);
    image(rock, x, y);
  }

  void move() {
    x = x + speed;
  }
}

