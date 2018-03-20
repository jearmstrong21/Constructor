class Point {
  PVector pos, vel, acc;
  boolean fixed=false;
  boolean isInEdge=false;
  Point(float x, float y) {
    pos=new PVector(x, y);
    vel=new PVector(0, 0);
    acc=new PVector(0, 0);
  }
  void display() {
    if (fixed) {
      stroke(colFixedPoint);
      fill(colFixedPoint);
    } else {
      stroke(200);
      fill(200);
    }
    ellipse(pos.x, pos.y, 10, 10);
  }
  void update() {
    if (pos.y<height-margin) {
      //GRAVITY
      acc.y=gravity;
    } else {
      acc.y=0;
    }
    if (pos.y>height-margin) {
      vel.y=-abs(min(bounceForce, vel.y));
      pos.y=height-margin;
    }
    vel=vel.add(acc);
    pos=pos.add(vel);
  }
}