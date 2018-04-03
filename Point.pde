JSONObject pointToJSON(Point p){
  JSONObject obj=new JSONObject();
  obj.setFloat("posx",p.posx);
  obj.setFloat("posy",p.posy);
  obj.setFloat("velx",p.velx);
  obj.setFloat("vely",p.vely);
  obj.setFloat("accx",p.accx);
  obj.setFloat("accy",p.accy);
  obj.setFloat("mass",p.mass);
  obj.setBoolean("fixed",p.fixed);
  return obj;
}
Point pointFromJSON(JSONObject obj){
  Point p=new Point(obj.getFloat("posx"),obj.getFloat("posy"));
  //vel,acc,mass,is fixed
  p.velx=obj.getFloat("velx");
  p.vely=obj.getFloat("vely");
  p.accx=obj.getFloat("accx");
  p.accy=obj.getFloat("accy");
  p.mass=obj.getFloat("mass");
  p.fixed=obj.getBoolean("fixed");
  return p;
}

class Point{
  float posx,posy,velx,vely,accx,accy;
  float mass;
  boolean fixed;
  
  Point(float x,float y){
    mass=PointMassDef;
    //mass=random(PointMassMi,PointMassMa);
    fixed=false;
    posx=x;
    posy=y;
    velx=0;
    vely=0;
    accx=0;
    accy=0;
  }
  
  //boolean isInEdge=false;
  void display(){
    float gray=map(mass,PointMassMi,PointMassMa,0,200);
    fill(gray);
    stroke(gray);
    float size=map(mass,PointMassMi,PointMassMa,PointSizeMi,PointSizeMa);
    if(fixed)setCol(color(200,100,100));
    ellipse(posx,posy,size,size);
  }
  void constrainMass(){
    if(mass<PointMassMi)mass=PointMassMi;
    if(mass>PointMassMa)mass=PointMassMa;
  }
  void update(){
    if(fixed)return;
    //TODO: apply gravity
    if(posy<height-floorHeight-2){
      accy+=gravity;
    }else{
      //exit();
      //accy*=-1;
      vely*=-0.5;
    }
    if(posy>height-floorHeight){
      vely=-abs(vely);
      posy=height-floorHeight;
    }
    posx+=velx;
    posy+=vely;
    velx+=accx;
    vely+=accy;
    //accx*=0.01;
    accy*=0.01;
  }
}