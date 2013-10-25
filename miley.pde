// convert -delay 20 -loop 0 miley-*.gif miley.gif

int X, Y;
int nX, nY;
int delay = 30;
float max_distance;

int X2, Y2;
float cur_deg = 0;
int radius = 50;
int count;

void setup(){
  size(300, 300);
  frameRate(30);
  strokeWeight(1);
  X = 0, Y = 0;
  nX = 0, nY = 0;
  max_distance = dist(0, 0, width, height);

  X2 = width/2 + radius;
  Y2 = height/2;

  count = 0;
}

void draw(){
  background(0);
  mouseMoved();
  moveAroundArc();
  drawLines();
  drawCircles();
  if (count < 1){
    // save('tmp.tif');
    // saveFrame('tmp.tif');
    count += 1;
  }
}

void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
  X += (nX-X)/delay;
  Y += (nY-Y)/delay;
}

void moveAroundArc(){
  cur_deg = (cur_deg + 0.2) % 360;
  X2 = width/2 + radius*cos(cur_deg);
  Y2 = height/2 + radius*sin(cur_deg);
}

void drawLines(){  
  for(int i = 2; i < width-2; i += 2) {
    if(i % 20 == 0) {
      stroke(255);
      line(i, 40, i, height);
    } else if (i % 10 == 0) {
      stroke(153);
      line(i, 20, i, 180);
      line(i, height/2, i, height-40);
    } else {
      stroke(102);
      line(i, 0, i, height);
      // line(i, height/2, i, height-40);
      // line(i, height/2, X, Y-40);
    }
  }
}

void drawCircles(){
  for(int i = 0; i <= width; i += 20) {
    for(int j = 0; j <= width; j += 20) {
      float size = dist(X2, Y2, i, j);
      size = size/max_distance * 60;
      ellipse(i, j, size, size);
    }
  }
}
