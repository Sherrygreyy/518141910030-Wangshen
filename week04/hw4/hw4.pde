boolean[] b=new boolean[4];
Status status;
boolean p1, p2, p3, p4;
color bc=color(0), tc=color(255);  
boolean change=false, collapse=false;  

void setup() {
  size(2000, 450);
  background(bc);
  frameRate(200);
  PFont font=createFont("MonotypeCorsiva-48.vlw",100);
  textAlign(CENTER,CENTER);
  textFont(font);
  fill(tc);
  text("The Chamber of Secrets has been opened", width/2, height/2-65);
  text("enemies of the heir...beware",width/2,height/2+65);
}

void draw() {
  if (collapse) {
    if (change) {
      update(0);
      change=false;
    } 
    else {
      update(1);
      change=true;
    }
  }
}

void mousePressed() {
  collapse=true;
}

void update(int g) {
  for (int i=g; i<width-1; i+=2) {
    for (int j=g; j<height-1; j+=2){
      if (get(i, j)!=bc) {
        p1=true;
      } else {
        p1=false;
      }
      if (get(i+1, j)!=bc) {
        p2=true;
      } else {
        p2=false;
      }
      if (get(i, j+1)!=bc) {
        p3=true;
      } else {
        p3=false;
      }    
      if (get(i+1, j+1)!=bc) {
        p4=true;
      } else {
        p4=false;
      }

      status=new Status(p1, p2, p3, p4);  
      b=status.output();  


      tc=color(int(510*(height-j)/height),0,0);
      if (b[0]==true) {
        set(i, j, tc);
      } else {
        set(i, j, bc);
      }
      if (b[1]==true) {
        set(i+1, j, tc);
      } else {
        set(i+1, j, bc);
      }
      if (b[2]==true) {
        set(i, j+1, tc);
      } else {
        set(i, j+1, bc);
      }
      if (b[3]==true) {
        set(i+1, j+1, tc);
      } else {
        set(i+1, j+1, bc);
      }
    }
  }
}
class Status {
  boolean s1, s2, s3, s4;  
  float p=50f;  
  boolean result[]=new boolean[4];

  Status(boolean b1, boolean b2, boolean b3, boolean b4) {

    if (b1==true && b2==false && b3==false && b4==false) {  
      s1=false;
      s2=b2;
      s3=true;
      s4=b4;
    } else if (b1==false && b2==true && b3==false && b4==false) {  
      s1=b1;
      s2=false;
      s3=b3;
      s4=true;
    } else if (b1==true && b2==true && b3==false && b4==false) { 
      float odd=random(100);
      if (odd<p) {
        s1=b1;
        s2=b2;
        s3=b3;
        s4=b4;
      } else {
        s1=false;
        s2=false;
        s3=true;
        s4=true;
      }
    } else if (b1==true && b2==false && b3==true && b4==false) { 
      s1=false;
      s2=b2;
      s3=b3;
      s4=true;
    } else if (b1==false && b2==true && b3==true && b4==false) {  
      s1=b1;
      s2=false;
      s3=b3;
      s4=true;
    } else if (b1==true && b2==true && b3==true && b4==false) {  
      s1=b1;
      s2=false;
      s3=b3;
      s4=true;
    } else if (b1==true && b2==false && b3==false && b4==true) {  
      s1=false;
      s2=b2;
      s3=true;
      s4=b4;
    } else if (b1==false && b2==true && b3==false && b4==true) {  
      s1=b1;
      s2=false;
      s3=true;
      s4=b4;
    } else if (b1==true && b2==true && b3==false && b4==true) {  
      s1=false;
      s2=b2;
      s3=true;
      s4=b4;
    } else {  
      s1=b1;
      s2=b2;
      s3=b3;
      s4=b4;
    }
  }

 
  boolean[] output() {
    boolean[] result={s1, s2, s3, s4};
    return result;
  }
}
