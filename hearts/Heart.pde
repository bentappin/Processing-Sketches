public class Heart {
  private int VARIATION = 50;

  private PImage _image;
  private int originalX;
  private int originalY;

  Integrator ix;
  Integrator iy;

  private boolean onWayHome = false;

  public Heart(int xpos, int ypos, color c)
  {
    ix = new Integrator(xpos);
    iy = new Integrator(ypos);
    originalX = xpos;
    originalY = ypos;

    _image = loadImage("heart_small.png");

    for( int i=0; i< _image.pixels.length; i++) {
      //println(_image.pixels[i]);
      if( _image.pixels[i] == -16777216) {
        _image.pixels[i] = c;
      }
    }
  }


  public void exist() {
    if(!onWayHome) {
      ix.target( random(ix.value-VARIATION, ix.value+VARIATION) );
      iy.target( random(iy.value-VARIATION, iy.value+VARIATION) );
    }

    ix.update();
    iy.update();

    if( abs(ix.target - ix.value) < 3 && abs(iy.target - iy.value) < 3) {
      onWayHome = false;
    }

    image(_image, ix.value,iy.value);
  } 

  public void sendHome() {
    ix.target(originalX);
    iy.target(originalY);
    onWayHome = true;
  }

}



