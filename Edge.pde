class Edge {
  Point a, b;
  float dist;
  //float d;
  float origDist;
  boolean isMuscle;
  float period;
  float amp;
  float off;
  int muscleType;
  Edge(Point p1, Point p2, float d) {
    p1.isInEdge=true;
    p2.isInEdge=true;
    a=p1;
    b=p2;
    isMuscle=false;
    //isMuscle=random(1)<0.25;
    //period=0.1;
    //amp=d;
    //off=0;
    origDist=d;
    //this.d=d;
    dist=d;
  }

  void constrainLength() {
    float ka=unfixedK;
    float kb=ka;
    //dist=3*d*(abs(cos(frameCount*0.01))+0.1);
    if(isMuscle){
      float val=0;
      if(muscleType==muscleJerkyCos){
        val=abs(cos(frameCount*period+off))+0.1;
        ka=kb=jerkyCosK;
      }
      else if(muscleType==muscleSmoothCos){
        val=(cos(frameCount*period+off)+1.5)/2.5;
        ka=kb=smoothCosK;
      }
      dist=amp*val;
    }
    if (a.fixed)kb=fixedK;
    if (b.fixed)ka=fixedK;

    PVector delta=PVector.sub(a.pos, b.pos);
    float deltaLength=delta.mag();
    if (abs(deltaLength)<1)return;
    float d=(deltaLength-dist)/deltaLength;
    if (!a.fixed) {
      a.pos.x-=delta.x*ka*d/2;
      a.pos.y-=delta.y*ka*d/2;
      a.update();
    }
    if (!b.fixed) {
      b.pos.x+=delta.x*kb*d/2;
      b.pos.y+=delta.y*kb*d/2;
      b.update();
    }
  }
  void display() {
    a.display();
    b.display();
    //stroke(0);
    if(isMuscle){
      if(muscleType==muscleJerkyCos)stroke(colMuscleJerkyCos);
      else if(muscleType==muscleSmoothCos)stroke(colMuscleSmoothCos);
    }else{
      stroke(colEdge);
    }
    line(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
  }
}