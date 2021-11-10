PImage wood;
FireworkSystem ps;
PVector center;
int mode = 0;

void setup() {
  size(1024, 526);
  wood=loadImage("wood.jpg");
  ps = new FireworkSystem();
  center = new PVector(512,213);
}

void draw() {
  image(wood,0,0);
  noStroke();
  fill(255,255,255);
  rect(30,30,60,30);
  rect(30,70,60,30);
  fill(0);
  text("fireworm",37,49);
  text("touch",38,89);
  ps.run();
}

void mouseReleased(){
  if (30<mouseX&&mouseX<90&&30<mouseY&&mouseY<60){
    mode=0;
    }
  else if(30<mouseX&&mouseX<90&&70<mouseY&&mouseY<100){
    mode=1;
    }
  else {
    if(mode==0){
    ps.addFirework();
  }
    else if(mode==1){
    ps.touch();
  }
  }
}

class Firework {
  PVector position;
  PVector velocity;
  PVector accelerate;
  float mass;

  Firework() {
    position = new PVector(mouseX,mouseY);
    velocity = new PVector(random(-1,1),random(-1,1));
    accelerate = new PVector(0,0);
    mass = 1.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(accelerate);
    position.add(velocity);
    float d = center.dist(position);
    float k = d/1800 ;
    k = pow(k,6);
    PVector a = position.copy();
    a.sub(center);
    velocity.sub(a.mult(k*0.2));
    if(velocity.mag()>0.8){velocity.mult(0.9);}      //萤火虫速度上限
    accelerate = new PVector(random(-0.1,0.1),random(-0.1,0.1));
    //accelerate.add(new PVector(random(-0.01,0.01),random(-0.01,0.01)));
  }

  // Method to display
  void display() {
    float t=random(100);
    float r = noise(t)*10;
    color col1 = color(255,255,0);
    color col2 = color(227,237,50,120);
    color col3 = color(#DFE83F,80);
    noStroke();
    fill(col1);
    ellipse(position.x, position.y, 8, 8);
    noFill();
    stroke(col2);
    strokeWeight(12-r);
    ellipse(position.x, position.y, 8+r, 8+r);
    stroke(col3);
    ellipse(position.x,position.y,15+r,15+r);
    
    
  }
  
  void click(){
    PVector pos = new PVector(mouseX,mouseY);
    pos.sub(position);
    float dis = pos.mag() + 1;
    float k = pow(1 - dis/1600,50);      //pow第二个参数调整touch影响范围程度
    pos.mult(k*0.5);     //系数调整touch弹开的距离
    velocity.sub(pos);
  }
}

class FireworkSystem {
  ArrayList<Firework> Fireworks;

  FireworkSystem() {
    Fireworks = new ArrayList<Firework>();
  }

  void addFirework() {
    Fireworks.add(new Firework());
  }
  
  void touch(){
    for (int i = Fireworks.size()-1; i >= 0; i--) {
      Firework p = Fireworks.get(i);
      p.click();
    }
  }

  void run() {
    for (int i = Fireworks.size()-1; i >= 0; i--) {
      Firework p = Fireworks.get(i);
      p.run();
    }
  }
}
