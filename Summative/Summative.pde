import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
Box2DProcessing box2d;
ArrayList<Box> boxes;
int start;
ArrayList<Cup> c;
float cupBaseX;
float rcupX;
float lcupX;

void setup() {
  size(640, 360);
  cupBaseX = width/2;
  rcupX= width/2-32.5;
  lcupX=width/2+32.5;
  smooth();
  background(255, 255, 255);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  boxes = new ArrayList<Box>();
  c = new ArrayList<Cup>();

  start=millis();
  c.add(new Cup(cupBaseX, height-50, 75, 10));
  c.add(new Cup(rcupX, height-85, 10, 75));
  c.add(new Cup(lcupX, height-85, 10, 75));
}


void draw() {

  background(255, 255, 255);
  int timer= millis()-start;
  textSize(20);
  text(((int)timer/1000), 10, 20);

  if (timer>30000)
  {
    background(0);
    fill(255, 255, 255);
    text("Game Over", width/2, height/2 );
  }
  box2d.step();

  if (random(1) < 0.2) {
    Box p = new Box(width/2, 30);
    boxes.add(p);
  }
  
  for (Cup wall : c) {
    wall.Draw();
  }


  for (Box b : boxes) {
    b.display();
  }
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
}
