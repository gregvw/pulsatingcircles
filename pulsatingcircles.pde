import java.util.Random;

Random rand = new Random();

int numCircles = 100;

// Create a randomly placed, sized, and colored circle that shrinks and grows
public class PulseCircle {
  float xc, yc;      // coordinates of center
  float rmin, rmax;  // minimum and maximum radii
  float rad;         // initial radius
  float drad;        // size change factor
  color clr;         // circle color
  boolean isGrowing;

  public PulseCircle() {

    xc = width*rand.nextFloat(); 
    yc = height*rand.nextFloat();

    rmin = 5+20*rand.nextFloat();
    rmax = 50+200*rand.nextFloat();
    drad = 3*rand.nextFloat();

    clr = color(255*rand.nextFloat(), 255*rand.nextFloat(), 255*rand.nextFloat());

    // Pick initial radius to be random between min and max 
    rad  = rmin+(rmax-rmin)*rand.nextFloat();

    // Pick isGrowing to be randomly true or false
    isGrowing = rand.nextBoolean();
  }

  void draw() {
    stroke(1.0);
    strokeWeight(1.0);
    fill(clr);
    ellipse(xc, yc, rad, rad);
    if (isGrowing) {
      if (rad <= rmax-drad) {
        rad += drad;
      } else {
        isGrowing = false;
      }
    } else {
      if (rad >= rmin+drad ) {
        rad -= drad;
      } else {
        isGrowing = true;
      }
    }
  }
} // class PulseCircle

PulseCircle[] pc;

void setup() {
  size(1080, 720);
  rand = new Random();
  
  pc = new PulseCircle[numCircles];
  for(int i=0;i<numCircles;++i) {
    pc[i] = new PulseCircle();
  }
}

void draw() {
  background(255, 255, 255);
  for(int i=0; i<numCircles; ++i) {
    pc[i].draw();
  }
}

