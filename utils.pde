
Point randPoint() {
  return points.get((int)random(points.size()));
}
boolean isEdgeModeMuscle=false;
Point intersection() {
  for (Point p : points)if (PVector.dist(new PVector(mouseX, mouseY), p.pos)<20)return p;
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
String getMode(){
  if(key==' ')return "pause/unpause simulation";
  if(key=='s')return "save construction";
  if(key=='o')return "open construction";
  if(key=='d')return "delete point";
  if(key=='p')return "place point";
  if(key=='f')return "toggle fixed point mode";
  if(key=='e')return "make an edge";
  if(key=='m')return "make jerky muscle edge";
  if(key==',')return "make smooth muscle edge";
  return "none";
}
void displayControls(){
  textAlign(LEFT, TOP);
  fill(0);
  stroke(0);
  textSize(10);
  float diff=15;
  //text("Constructor V"+versionNumber+"\n' ' - pause/unpause simulation\n's' - save construction\n'o' - open construction\n'd' - delete point\n'p' - place point\n'f' - toggle fixed mode\n'e' - make edge\n'm' - make jerky muscle edge\n',' - make smooth muscle edge", 2, 2);
  fill(colTitle);
  stroke(colTitle);
  textFont(fontBold);
  text("Constructor V"+versionNumber,2,2);
  fill(0);
  stroke(0);
  textFont(fontNormal);
  text("' ' - pause/unpause simulation",2,2+diff*1);
  text("'s' - save construction",2,2+diff*2);
  text("'o' - open construction",2,2+diff*3);
  text("'d' - delete point",2,2+diff*4);
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
  text("'"+key+"' - "+getMode(),2,2+diff*11);
  textAlign(LEFT,BOTTOM);
  text("Currently opened file: "+curOpened,0,height);
}