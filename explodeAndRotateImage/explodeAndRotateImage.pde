PImage img;       // The source image
int cellsize = 4; // Dimensions of each cell in the grid
int COLS, ROWS;   // Number of columns and rows in our system
float angle;


void setup()
{
  img = loadImage("a_picture.jpg");     // Load the image
  
  size(img.width*2, img.height*2, P3D); 
  
  COLS = (width/2)/cellsize;            // Calculate # of columns
  ROWS = (height/2)/cellsize;           // Calculate # of rows
  colorMode(RGB,255,255,255,100);   // Setting the colormode
  
  frameRate(15);
}

void draw()
{
  // Update and constrain the angle
  angle += 0.01;
  if (angle > TWO_PI) { angle = 0; }
  
  // Rotate around the center axis
  translate(width/2, 0, 64);
  rotateY(angle);  
  translate(-width/2, 0, 64);
  
  translate(img.width/2, img.height/2,0);

  background(0);
  
  // Begin loop for columns
  for ( int i = 0; i < COLS;i++) {
    // Begin loop for rows
    
    for ( int j = 0; j < ROWS;j++) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*(width/2);           // Pixel array location
      color c = img.pixels[loc];       // Grab the color
      
      // Calculate a z position as a function of mouseX and pixel brightness
      
      float z = (mouseX / (float) width) * brightness(img.pixels[loc]) - 100.0f;
      // Translate to the location, set fill and stroke, and draw the rect
      
      pushMatrix();
      translate(x,y,z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();
    }
  }
}
