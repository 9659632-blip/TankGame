class Projectile {
  // Member varaiables
  float x, y, w, h, speed;
  char dir;


  //Constructor
  Projectile(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    speed = 10;
    dir = 'u';
  }

  void display() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }

  void move() {
    y = y - speed;
  }
}
