
size(800, 800);  
background(0);  


double a = -1000, b = 0.2, c = -35;
int mag=10;

double x1=0, y1=0, temp;  

for (int i = 0; i < 2550000; i++) {

  temp = x1;
  x1 = y1 - Math.signum(a * x1) * Math.sqrt(Math.abs(b * x1 - c));
  y1 = a -temp;

  int m = (int) (x1 * mag + width/2);
  int n = (int) (y1 * mag + height/2);
 // stroke(255, i/10000, i/10000);
  stroke(255-i/100,255-i/10000,i/100);
  point(m, n);
  point(800-m,800-n);
  point(m,800-n);
  point(800-m,n);
}
