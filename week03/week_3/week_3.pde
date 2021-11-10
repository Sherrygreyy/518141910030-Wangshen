float t = random(100,300);
float m = random(50,150);
float l = random(800,990);
float x =random(600,800);
float e =random(300,500);
void setup(){
  size(1000,1000);
  background(20);
}

void draw(){
  stroke(100);
  strokeWeight(20);
  line(0,t,1000,t);
  line(0,l,1000,l);
  line(m,0,m,1000);
  line(x,0,x,l);
  line(0,e,x,e);
  line(x,x,1000,x);
  line(t,l,t,1000);
  }
