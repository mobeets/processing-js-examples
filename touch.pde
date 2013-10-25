// Global variables
float radius = 50.0;

int X, Y;
int eX, eY;
int nX, nY;
int delay = 55;
int evilDelay = 20;

int BACKGROUND_COLOR = 100;
int STROKE_COLOR = 255;
int TEXT_COLOR = 0;

int CIRCLE_BORDER = 5;

// Setup the Processing Canvas
void setup(){
  size(300, 300);
  strokeWeight(CIRCLE_BORDER);
  frameRate(15);
  textSize(32);
  nX = X;
  nY = Y;
  X = width / 2;
  Y = height / 2;
  eX = 0;
  eY = 0;
}

// Main draw loop
void draw(){
  
  radius = radius + sin(frameCount / 4);
  
  // Fill canvas grey
  background(BACKGROUND_COLOR);
  

  // Set stroke-color white
  stroke(STROKE_COLOR);
  
  drawGoodCircle(true);
  drawEvilCircle();
  checkCollisions();
}

// Set circle's next destination
void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
}

// Draw circle at new location
void drawGoodCircle(safe){
    // Set fill-color to blue
    if (safe){
        fill(0, 121, 184);
    }
    // Set fill-color to red
    else {
        fill(255, 50, 50);
    }
    for (int i = 0; i < delay; i = i+2) {
          // Track circle to new destination
          X += (nX-X)/delay;
          Y += (nY-Y)/delay;
          // Draw circle
          ellipse(X, Y, radius, radius);
    }
}

void drawEvilCircle(){
    // Set fill-color to pink
    fill(200, 121, 184);

    // Track circle to new destination
    if (!(abs(X - eX) < radius + CIRCLE_BORDER && abs(Y - eY) < radius + CIRCLE_BORDER)){
      eX += (nX-eX)/evilDelay;
      eY += (nY-eY)/evilDelay;
    }
    // Draw circle
    ellipse(eX, eY, radius, radius);
}

void checkCollisions(){
    if (abs(X - eX) < radius + CIRCLE_BORDER && abs(Y - eY) < radius + CIRCLE_BORDER){
        drawGoodCircle(false);
        fill(TEXT_COLOR);
        String textstring = "No touch!";
        float twidth = textWidth(textstring);
        text(textstring, (width-twidth)/2, height/2);
    }
}
