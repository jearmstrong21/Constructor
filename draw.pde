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
    fill(255, 0, 0);
    stroke(255, 0, 0);
    ellipse(p1.pos.x, p1.pos.y, 40, 40);
  }
  Point p=intersection();
  if (p!=null) {
    fill(0, 0, 255, 100);
    stroke(0, 0, 255, 100);
    ellipse(p.pos.x, p.pos.y, 40, 40);
  }

  displayControls();
}