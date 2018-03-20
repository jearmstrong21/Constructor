void mousePressed() {
  if (key=='p')points.add(new Point(mouseX, mouseY));
  else if (key=='f') {
    Point i=intersection();
    if (i!=null)i.fixed=!i.fixed;
  } else if (key=='e'||key=='m'||key==',') {
    isEdgeModeMuscle=key=='m'||key==',';
    Point i=intersection();
    if (i==null)return;
    if (p1==null)p1=i;
    else if (p2==null) {
      p2=i;
      Edge edge=new Edge(p1,p2,100);
      edge.isMuscle=false;
      edge.muscleType=-1;
      if(isEdgeModeMuscle){
        edge.isMuscle=true;
        edge.period=0.1;
        edge.amp=100;
        edge.off=0;
        if(key=='m')edge.muscleType=muscleJerkyCos;
        else if(key==',')edge.muscleType=muscleSmoothCos;
      }
      edges.add(edge);
      p1=p2=null;
    }
  }
}