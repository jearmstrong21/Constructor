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
    if (i==null)return;
    removeEdgesWithPoint(i);
    points.remove(i);
  }
}