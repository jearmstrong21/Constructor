JSONObject toJSON() {
  JSONObject obj=new JSONObject();
  obj.setFloat("fixedK", fixedK);
  obj.setFloat("unfixedK", unfixedK);
  obj.setFloat("gravity",gravity);
  obj.setFloat("margin",margin);
  obj.setFloat("jerkyCosK",jerkyCosK);
  obj.setFloat("smoothCosK",smoothCosK);
  JSONArray pointsArr=new JSONArray();
  JSONArray edgesArr=new JSONArray();

  for (Point p : points) {
    JSONObject pointObj=new JSONObject();
    pointObj.setFloat("posx", p.pos.x);
    pointObj.setFloat("posy", p.pos.y);
    pointObj.setFloat("velx", p.vel.x);
    pointObj.setFloat("vely", p.vel.y);
    pointObj.setFloat("accx", p.acc.x);
    pointObj.setFloat("accy", p.acc.y);
    pointObj.setBoolean("fixed", p.fixed);
    pointObj.setBoolean("isInEdge", p.isInEdge);
    pointsArr.append(pointObj);
  }
  for (Edge e : edges) {
    JSONObject edgeObj=new JSONObject();
    edgeObj.setFloat("dist", e.dist);
    edgeObj.setBoolean("isMuscle",e.isMuscle);
    if(e.isMuscle){
      edgeObj.setFloat("amp",e.amp);
      edgeObj.setFloat("period",e.period);
      edgeObj.setFloat("off",e.off);
    }
    edgeObj.setInt("a", points.indexOf(e.a));
    edgeObj.setInt("b", points.indexOf(e.b));
    edgeObj.setInt("type",e.muscleType);
    edgesArr.append(edgeObj);
  }

  obj.setJSONArray("pointsArr", pointsArr);
  obj.setJSONArray("edgesArr", edgesArr);
  return obj;
}