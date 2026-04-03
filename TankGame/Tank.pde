class Tank {
  // Member varaiables
  float x, y, w, h, speed, health;
  PImage iTankW,iTankA,iTankS,iTankD;
  char idir;

  //Constructor
  Tank() {
    x = 100.0;
    y = 100.0;
    w = 100.0;
    h = 100.0;
    speed = 2.0;
    health = 75.0;
    iTankW = loadImage("tankW.png");
    iTankA = loadImage("tankA.png");
    iTankS = loadImage("tankD.png");
    iTankD = loadImage("tankS.png");
    idir = 'w';
  }
  
  void display() {
 imageMode(CENTER);
 if(idir == 'w') {
   image(iTankW,x,y);
  }if(idir == 'a') {
   image(iTankA,x,y);
   }if(idir == 's') {
   image(iTankA,x,y);
    }if(idir == 'd') {
   image(iTankA,x,y);
  }
   
  }
  void move(char dir) {
   if (dir == 'w') {
        y = y - speed;
    } else if (dir == 's') {
        y = y + speed;
    } else if (dir == 'a') {
        x = x - speed;
    } else if (dir == 'd') {
        x = x + speed;
    }
}

void fire() {
}
}
