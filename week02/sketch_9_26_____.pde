
void setup(){
  size(1000,1000);
  smooth();
}
void draw() {
  float c=0;
  c=map(mouseX,0,width,0,255);
  background(c);
  noFill();
  stroke(#DFC4FF,160);
  for (int i=0; i<20; i=i+1){
  float degree =radians((millis()+50*i)/6.18);
  float a = sin(degree);
  float sw = map(a, -1, 1, 50, 10);
  strokeWeight(sw);
  float r= i*map(a,-1,1,200,20);
  ellipse(width/2,height/2,r,r);
}
}
