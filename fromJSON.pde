void fromJSON(JSONObject obj) {
  fixedK=obj.getFloat("fixedK");
  unfixedK=obj.getFloat("unfixedK");
  gravity=obj.getFloat("gravity");
  margin=obj.getFloat("margin");
  jerkyCosK=obj.getFloat("jerkyCosK");
  smoothCosK=obj.getFloat("smoothCosK");
  JSONArray pointsArr=obj.getJSONArray("pointsArr");
  points=new ArrayList<Point>();
  println("Loading points");
  for (int i=0; i<pointsArr.size(); i++) {
    print(i);
    JSONObject pointObj=pointsArr.getJSONObject(i);
    Point p=new Point(pointObj.getFloat("posx"), pointObj.getFloat("posy"));
    p.vel=new PVector(pointObj.getFloat("velx"), pointObj.getFloat("vely"));
    p.acc=new PVector(pointObj.getFloat("accx"), pointObj.getFloat("accy"));
    p.fixed=pointObj.getBoolean("fixed");
    p.isInEdge=pointObj.getBoolean("isInEdge");
    points.add(p);
  }
  println("\nLoading edges");
  JSONArray edgesArr=obj.getJSONArray("edgesArr");
  edges=new ArrayList<Edge>();
  for (int i=0; i<edgesArr.size(); i++) {
    print(i);
    JSONObject edgeObj=edgesArr.getJSONObject(i);
    Edge e=new Edge(points.get(edgeObj.getInt("a")), points.get(edgeObj.getInt("b")), edgeObj.getFloat("dist"));
    e.isMuscle=edgeObj.getBoolean("isMuscle");
    if(e.isMuscle){
      e.muscleType=edgeObj.getInt("type");
      e.amp=edgeObj.getFloat("amp");
      e.period=edgeObj.getFloat("period");
      e.off=edgeObj.getFloat("off");
    }
    edges.add(e);
  }
  println();
}