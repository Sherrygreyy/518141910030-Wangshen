float mutationRate = 0.05;
int totalPopulation =150;

DNA[] population;
ArrayList<DNA> matingPool;
String target;
boolean flag;


void setup(){
  size(800,400);
  frameRate(20);
  stroke(255);
  textSize(100);
  flag = true;
  target="~55";
  population = new DNA[totalPopulation];
  for(int i=0;i<population.length;i++){
    population[i] = new DNA(target.length());
  }
}

void draw(){
  if(flag==true){
    for(int i=0;i<population.length;i++){
      population[i].fitness();
    }
    ArrayList<DNA> matingPool = new ArrayList<DNA>();
    for(int i=0;i<population.length;i++){
      int n = int(population[i].fitness*100);
      for(int j=0;j<n;j++){
        matingPool.add(population[i]);
      }
    }
    for(int i=0;i<population.length;i++){
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
      DNA partnerA = matingPool.get(a);
      DNA partnerB = matingPool.get(b);
      DNA child = partnerA.crossover(partnerB);
      child.mutate(mutationRate);
      population[i] = child;
    }
  
    background(255);
    fill(0);
    String everything = "";
    for(int i=0;i<population.length;i++){
      everything += population[i].getPhrase() + "    ";
      
      targetdraw(population[i].getPhrase());
    }
    fill(0);
  text("IMPOSSIBLE",random(width),random(height));}
    fill(255,second()*10);
  text("I'M POSSIBLE",100,200);
    }



void targetdraw(String target){
  //int[] para = new int[target.length()];
  int[] para = new int[3];
  for(int i=0;i<target.length();i++){
    para[i] = (int)(target.toCharArray()[i]);
  }
  background(para[0]*2,para[1]*2,para[2]*2);
}

void mouseReleased(){
  if(flag==true){flag = false;}
  else{flag = true;}
}

class DNA{
  char[] genes;
  float fitness;
  
  DNA(int num){
    genes = new char[num];
    for(int i=0;i<genes.length;i++){
      genes[i] = (char)random(32,128);
    }
  }
  
  void fitness(){
    int score = 0;
    for(int i=0;i<genes.length;i++){
      if(genes[i]==target.charAt(i)){score++;}
    }
    fitness = float(score)/target.length();
  }
  
  String getPhrase(){
    return new String(genes);
  }
  
  DNA crossover(DNA partner){
    DNA child = new DNA(genes.length);
    int midpoint = int(random(genes.length));
    for(int i=0;i<genes.length;i++){
      if (i>midpoint){
        child.genes[i]=genes[i];
      }
      else{
      child.genes[i]=partner.genes[i];
      }
    }
    return child;
  }
  
 void mutate(float mutationRate){
   for (int i=0;i<genes.length;i++){
      if(random(1)<mutationRate){
        genes[i] = (char)random(32,128);
      }
   }
 } 
  
}
