
Point randPoint() {
  return points.get((int)random(points.size()));
}
boolean isEdgeModeMuscle=false;
Point intersection() {
  for (Point p : points)if (PVector.dist(new PVector(mouseX, mouseY), p.pos)<pointSelectDist)return p;
  return null;
}
void removeEdgesWithPoint(Point p) {
  for (int i=0; i<edges.size(); i++) {
    Edge e=edges.get(i);
    if (e.a==p||e.b==p) {
      edges.remove(i);
      if (e.a!=p)e.a.isInEdge=false;
      if (e.b!=p)e.b.isInEdge=false;
      removeEdgesWithPoint(p);
    }
  }
}
int numPointsInEdge(){
  int i=0;
  for(Point p:points)if(p.isInEdge)i++;
  return i;
}
Edge edgeIntersection(){
  for(Edge e:edges){
    PVector p=e.getCenter();
    if(PVector.dist(new PVector(mouseX,mouseY),p)<edgeSelectDist)return e;
  }
  return null;
}
void displayVars(){
  fill(0);
  stroke(0);
  textFont(fontNormal);
  textAlign(RIGHT,TOP);
  float diff=15;
  text("Tension for fixed point edges: "+fixedK,width-2,2+diff*0);
  text("Tension for normal edges: "+unfixedK,width-2,2+diff*1);
  text("Tension for smooth muscle edges: "+smoothCosK,width-2,2+diff*2);
  text("Tension for jerky muscle edges: "+jerkyCosK,width-2,2+diff*3);
  text("Gravity: "+gravity,width-2,2+diff*4);
  
  text("# of points: "+points.size(),width-2,2+diff*6);
  text("# of edges: "+edges.size(),width-2,2+diff*7);
  text("# of points in edges: "+numPointsInEdge(),width-2,2+diff*8);
  text("# of points not in edges: "+(points.size()-numPointsInEdge()),width-2,2+diff*9);
}
String getMode(){
  if(key==' ')return "pause/unpause simulation";
  if(key=='s')return "save construction";
  if(key=='o')return "open construction";
  if(key=='d')return "delete point/edge";
  if(key=='p')return "place point";
  if(key=='f')return "toggle fixed point mode";
  if(key=='e')return "make an edge";
  if(key=='m')return "make jerky muscle edge";
  if(key==',')return "make smooth muscle edge";
  if(key=='c')return "toggle is muscle";
  if(key=='v')return "cycle muscle type";
  return "none";
}
void displayControls(){
  textAlign(LEFT, TOP);
  fill(0);
  stroke(0);
  textSize(10);
  float diff=15;
  fill(colTitle);
  stroke(colTitle);
  textFont(fontBold);
  text("Constructor V"+versionNumberFormatted,2,2);
  fill(0);
  stroke(0);
  textFont(fontNormal);
  text("' ' - pause/unpause simulation",2,2+diff*1);
  text("'s' - save construction",2,2+diff*2);
  text("'o' - open construction",2,2+diff*3);
  text("'d' - delete point/edge",2,2+diff*4);
  text("'p' - place point",2,2+diff*5);
  fill(colFixedPoint);
  stroke(colFixedPoint);
  text("'f' - toggle fixed point mode",2,2+diff*6);
  fill(0);
  stroke(0);
  text("'e' - make an edge",2,2+diff*7);
  fill(colMuscleJerkyCos);
  stroke(colMuscleJerkyCos);
  text("'m' - make jerky muscle edge",2,2+diff*8);
  fill(colMuscleSmoothCos);
  stroke(colMuscleSmoothCos);
  text("',' - make smooth muscle edge",2,2+diff*9);
  fill(0);
  stroke(0);
  text("'c' - toggle is muscle",2,2+diff*10);
  text("'v' - cycle muscle type",2,2+diff*11);
  text("'"+key+"' - "+getMode(),2,2+diff*13);
  textAlign(LEFT,BOTTOM);
  text("Currently opened file: "+curOpened,0,height);
}