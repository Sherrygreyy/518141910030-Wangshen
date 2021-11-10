float s=second();
float d = random(20,50);
int mode = 0;
int start = 0;

void setup(){
  size(1080,1080);
  background(0);
  rect(30,30,30,30);
  rect(30,70,30,30);
  fill(100);
  text("line",37,49);
  text("dot",38,89);
}

void draw(){
  if (start == 1){
    if(mode==0){
    runlines(1);
    }
    else if(mode==1){
    rundot();
    }
  }
}

void mousePressed(){
  if (30<mouseX&&mouseX<60&&30<mouseY&&mouseY<60){mode=0;start=0;}
  else if(30<mouseX&&mouseX<60&&70<mouseY&&mouseY<100){mode=1;start=0;}
  else {start=abs(1-start);}
}

void runlines(int x){
  stroke(s*x,50,100,125);
  if (mouseX>540&&mouseY<540){
  line(mouseX,mouseY,540,(mouseX-540));
  line((1080-mouseX),mouseY,540,(mouseX-540)); 
 }
  if(mouseX<540&&mouseY<540){
   line(mouseX,mouseY,540,(mouseX));
   line((1080-mouseX),mouseY,540,mouseX);
  }
  if(mouseX>540&&mouseY>540){
  line(mouseX,mouseY,540,(mouseX-540));
  line((1080-mouseX),mouseY,540,(mouseX-540)); 
  }
  if(mouseX<540&&mouseY>540){
  line(mouseX,mouseY,540,540+mouseX);
  line(1080-mouseX,mouseY,540,540+mouseX);
  }
}

void dot(){
  stroke(255, 0);
  fill(round(random(0,255)),round(random(0,255)),round(random(0,255)),50);
  float degree = radians(random(0,360));
  float x = mouseX + 20*cos(degree);
  float y = mouseY + 20*sin(degree);
  ellipse(x , y, d,d);
}

void rundot(){
  for(int i=0;i<4;i++){
    dot();
  }
}
