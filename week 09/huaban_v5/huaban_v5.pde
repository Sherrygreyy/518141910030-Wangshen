float s=second();
int mode = -1;
int start = 0;
int R=255;
int G=255;
int B=255;
int dotcount =0;
float x = 0;
float y = 0;
float ax = 0;
float ay = 0;
float f = 0;
float r=0;
ArrayList<Particle> particles;
int colormode = 0;
color color0 = color(124,252,0,255);
color color1 = color(155,48,255);
//color color1=color(#CFD3D3);
color color2 = color(191,239,255,255);

void setup(){
  frameRate(60);
  size(1080,1080);
  background(0);
  particles = new ArrayList<Particle>();
  fill(255,255,255);
  rect(30,30,30,30);
  rect(30,70,30,30);
  rect(30,110,30,30);
  rect(30,150,30,30);
  rect(1000,30,30,30);
  rect(1000,70,30,30);
  fill(0);
  text("line",37,49);
  text("dot",38,89);
  text("pen",38,129);
  text("ink",38,169);
  text("clear",1002,49);
  text("save",1002,89);
}

void draw(){
  if (start == 1){
    if(mode==0&&mousePressed){
      frameRate(30);
      runlines(R,G,B);
    }
    else if(mode==1&&mousePressed){
      frameRate(60);
      rundot();
    }
    else if(mode==2&&mousePressed){
      frameRate(90);
      runpen();
    }
    else if(mode==3&&mousePressed){
      frameRate(60);
      runink();
    }
  }
  
  if(mousePressed){
    if(1000<mouseX&&mouseX<1030&&30<mouseY&&mouseY<60){
      background(0);
      mode =-1;
      stroke(1);
      strokeWeight(1);
      fill(255,255,255);
      rect(30,30,30,30);
      rect(30,70,30,30);
      rect(30,110,30,30);
      rect(30,150,30,30);
      rect(1000,30,30,30);
      rect(1000,70,30,30);
      fill(0);
      text("line",37,49);
      text("dot",38,89);
      text("pen",38,129);
      text("ink",38,169);
      text("clear",1002,49);
      text("save",1002,89);
    }
  }
}
void mouseReleased(){
  ax=0;
  ay=0;
  x=0;
  y=0;
  f=0;
}

void mousePressed(){
  //line
  if (30<mouseX&&mouseX<60&&30<mouseY&&mouseY<60){
    mode=0;
    start=0;
    R = round(random(0,255));
    G = round(random(0,255));
    B = round(random(0,255));
    stroke(0);
    fill(R,G,B);
    rect(30,30,30,30);
    fill(0);
    text("line",37,49);
    stroke(0);
    fill(255);
    rect(30,70,30,30);
    fill(0);
    text("dot",37,89);
    stroke(0);
    fill(255);
    rect(30,110,30,30);
    fill(0);
    text("pen",37,129);

    }
  //dot
  else if(30<mouseX&&mouseX<60&&70<mouseY&&mouseY<100){
    mode=1;start=0;
    stroke(255,0,0);
    fill(255);
    rect(30,70,30,30);
    fill(0);
    text("dot",37,89);
    stroke(0);
    fill(255);
    rect(30,110,30,30);
    fill(0);
    text("pen",37,129);
    stroke(0);
    }
  //pen
  else if(30<mouseX&&mouseX<60&&110<mouseY&&mouseY<140){
    mode=2;start=0;
    stroke(0);
    fill(255);
    rect(30,70,30,30);
    fill(0);
    text("dot",37,89);
    stroke(255,0,0);
    fill(255);
    rect(30,110,30,30);
    fill(0);
    text("pen",37,129);
    stroke(0);
    }
  //ink
  else if(30<mouseX&&mouseX<60&&150<mouseY&&mouseY<180){
    mode=3;
    start=0;
    colormode = (colormode+1)%3;
    if(colormode == 0){fill(color0);}
    else if (colormode == 1){fill(color1);}
    else if (colormode == 2){fill(color2);}
    else {fill(255);}
    stroke(0);
    rect(30,150,30,30);
    fill(0);
    text("ink",38,169);
    stroke(0);
    fill(255);
    rect(30,70,30,30);
    fill(0);
    text("dot",37,89);
    stroke(0);
    fill(255);
    rect(30,110,30,30);
    fill(0);
    text("pen",37,129);
    }
  //clear
  else if(1000<mouseX&&mouseX<1030&&70<mouseY&&mouseY<110){start=0;save("E:/processing-4.0b1-windows64/picture/p1.jpg");}
  else {start=1;}
}

//line
void runlines(int R, int G, int B){
  stroke(R,G,B,125);
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

//dot
void dot(){
  stroke(255, 0);
  fill(round(random(100,255)),round(random(80,200)),round(random(220,255)),190);
  float r = random(10, 30);
  rect(random(mouseX-60, mouseX+60), random(mouseY-60, mouseY+60), r, r);
}
void rundot(){
  dotcount += 1;
  if(dotcount%3==0){
    for(int i=0;i<4;i++){
    dot();
    }
  }
}

//colorpen
void runpen(){
  colorMode(HSB);
  stroke(frameCount%360, 100, 290);
  float oldR = r;
  float distance = 10;
  float spring = 0.5;
  float friction = 0.5;
  float size = 20;
  float diff = size/6;
  
  
  if(mousePressed==true) {
    float mX = mouseX;
    float mY = mouseY;
    if(f==0) {
      f = 1;
      x = mX;
      y = mY;
    }
    ax += ( mX - x ) * spring;
    ay += ( mY - y ) * spring;
    ax *= friction;
    ay *= friction;
    float a=0;
    a += sqrt( ax*ax + ay*ay ) - a;
    a *= 0.6;
    r = size - a;
    
    for( int i = 0; i < distance; ++i ) {
      float oldX = x;
      float oldY = y;
      x += ax / distance;
      y += ay / distance;
      oldR += ( r - oldR ) / distance;
      if(oldR < 1) oldR = 1;
      strokeWeight( oldR+diff );
      line( x, y, oldX, oldY );
      strokeWeight( oldR );
      line( x+diff*2, y+diff*2, oldX+diff*2, oldY+diff*2 );
      line( x-diff, y-diff, oldX-diff, oldY-diff );
    }
  } else if(f==1) {
    ax = ay = f = 0;
  }
  colorMode(RGB);
  strokeWeight(1);
}

class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float alpha;
  float palpha;
  float amp;
  float rate;
  
  
  
  Particle(float x,float  y,float  r,float  a) {

    location = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0,0);
    alpha = a;
    palpha = a;
    amp = 3; // size of the particle
    rate = r;

  }


  void update(ArrayList p) {
    acceleration.add( new PVector((noise(location.x) * 2 - 1), (noise(location.y) * 2 - 1)));
    velocity.add(acceleration);
    acceleration.set(0, 0);
    location.add(velocity);
    alpha -= rate;
    if (alpha <= palpha * 0.25 && palpha > 10) {
      p.add(new Particle(location.x, location.y, rate * 0.25, palpha * 0.5));
    }
  }

  void show() {
    noStroke();
    if(colormode == 0){
      fill(124,252,0,alpha);
    }
    else if(colormode == 1){
     fill(155,48,255,alpha);
    }
    else if(colormode == 2){
      fill(191,239,255,alpha);
    }
    //fill(124,252,0,alpha);
    ellipse(location.x, location.y,amp, amp);
  }
}

void runink(){
  if (mousePressed) {
    particles.add(new Particle(mouseX, mouseY, 12, 75));
  }
  for (int i = particles.size() - 2; i >= 0; i--) {
    particles.get(i).update(particles);
    particles.get(i).show();
    if (particles.get(i).alpha <= 2) {particles.remove(i);} // remove the dead particle
  }
}
