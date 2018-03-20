void draw() {
  background(255);
  line(margin, height-margin, width-margin, height-margin);
  for (Edge e : edges) {
    if (isSim)e.constrainLength();
  }
  for (Edge e : edges) {
    e.display();
  }
  for (Point p : points) {
    if (p.isInEdge)continue;
    p.display();
  }
  if (p1!=null) {
    fill(255, 0, 0,100);
    stroke(255, 0, 0,100);
    ellipse(p1.pos.x, p1.pos.y, 40, 40);
  }
  Point p=intersection();
  if (p!=null) {
    fill(0, 0, 255, 100);
    stroke(0, 0, 255, 100);
    ellipse(p.pos.x, p.pos.y, pointSelectDist*2, pointSelectDist*2);
  }
  Edge e=edgeIntersection();
  if(e!=null){
    fill(0,255,255,100);
    stroke(0,255,255,100);
    PVector center=e.getCenter();
    ellipse(center.x,center.y,edgeSelectDist*2,edgeSelectDist*2);
  }

  displayVars();
  displayControls();
}