
String curOpened="Untitled.constr"+versionNumber;

ArrayList<Point>points=new ArrayList<Point>();
ArrayList<Edge>edges=new ArrayList<Edge>();

Point p1=null;
Point p2=null;
boolean isSim=false;
float fixedK=2;
float unfixedK=0.25;
float jerkyCosK=1;
float smoothCosK=1;

float gravity=0.01;
int muscleJerkyCos=0;
int muscleSmoothCos=1;

float bounce=1;
float margin=50;
float bounceForce=2;
float pointSelectDist=20;
float edgeSelectDist=20;

color colMuscleJerkyCos=color(255,0,0);
color colMuscleSmoothCos=color(50,200,50);
color colEdge=color(0);
color colFixedPoint=color(200,50,50);
color colTitle=color(50,50,200);