class Cup
{

  float w;
  float h;
  float x;
  float y;

  Body c;

  Cup(float x_, float y_, float w_, float h_)
  {
    x=x_;
    y=y_;
    w=w_;
    h=h_;

    PolygonShape sd= new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);

    BodyDef bd = new BodyDef();
    bd.type = BodyType.KINEMATIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    c= box2d.createBody(bd);

    c.createFixture(sd, 10);
  }

  void Draw()
  {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void applyforce(Vec2 force)
  {
    Vec2 pos = c.getWorldCenter();
c.applyForce(force,pos);
  }
  
}
