//declare variables
int i = 0;
int count = 30;
float[] x = new float[count];//creates arrays for x, y, velX, velY, diam and a
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float[] diam = new float[count];
float[] a = new float[count];
void setup() {
  //set size of canvas
  size(800, 600);
  //initialize variables
  while(i < count) {
    
  x[i] = width/2;//balls will start at the middle, have random velocity and diameter in between given values
  y[i] = height/2;
  velX[i]= random(-5, 5);
  velY[i] = random(-5, 5);
  diam[i] = random(40,80);
  a[i] = .1;//acceleration will increment by .1
  i++;
}
}
void draw() {
  //draw background to cover previous frame
  background(0);
for(int i = 0;i < count; i++) {//puts count in a for loop so that everytime count is greater than i(which is once again 0) i will continually increase (which makes the balls move
  //draw ball
 fill(random(255),(255), (255));
  ellipse(x[i], y[i], diam[i], diam[i]);

  //add gravity and velocity to position
  x[i] += velX[i];
  y[i] += velY[i]+a[i];
  velY[i] += a[i];

  //bounce ball if it hits walls
  if (x[i] + diam[i]/2 >= width) {
    velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x[i] - diam[i]/2 <= 0) {
    velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
   if (y[i] + diam[i]/2 >= height) {//if it reaches bottom wall ball will reverse
    velY[i] = -abs(velY[i]);
  } else if (y[i] - diam[i]/2 <= 0) {//if it reaches top wall it will reverse
    velY[i] = abs(velY[i]);
  }
}
}