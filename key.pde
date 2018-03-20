void keyPressed() {
  if (key==' ')isSim=!isSim;
  else if (key=='s') {
    isSim=false;
    selectOutput("Save construction", "saveFileSelected", new File("~/Documents/MyConstructor/Untitled.constr"+versionNumber));
  } else if (key=='o') {
    isSim=false;
    selectInput("Open construction", "openFileSelected", new File("~/Documents/MyConstructor/"));
  } else if (key=='d') {
    Point i=intersection();
    if (i!=null){
      removeEdgesWithPoint(i);
      points.remove(i);
    }else {
      Edge e=edgeIntersection();
      if(e!=null){
        e.a.isInEdge=false;
        e.b.isInEdge=false;
        edges.remove(e);
      }
    }
  }else if(key=='c'){
    Edge e=edgeIntersection();
    if(e!=null){
      e.isMuscle=!e.isMuscle;
      e.dist=100;
      if(e.isMuscle){
        if(e.amp==-1){
          e.period=0.1;
          e.amp=100;
          e.off=0;
          e.muscleType=muscleSmoothCos;
        }
      }
    }
  }else if(key=='v'){
    Edge e=edgeIntersection();
    if(e!=null){
      if(e.isMuscle){
        if(e.muscleType==muscleJerkyCos)e.muscleType=muscleSmoothCos;
        else if(e.muscleType==muscleSmoothCos)e.muscleType=muscleJerkyCos;
        e.dist=100;
      }
    }
  }
}