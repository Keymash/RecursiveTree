float branchLength = 100;
float branchAngle = 1;
float branchFalloff = 0.6;
int iterations = 1;

void setup()
{
  size(500, 500);
  stroke(255);
  frameRate(10);
}

void draw()
{
  background(0);
  Branch(width/2, height, 0, iterations, branchLength);
}

void keyPressed()
{
  if (key == '+')
  {
    iterations++;
  }
  if (key == '-')
  {
    if (iterations > 1)
    iterations--;
  }
  if (keyCode == UP)
  {
    branchFalloff *= 1.2;
  }
  if (keyCode == DOWN)
  {
    branchFalloff *= 0.85;
  }
  if (keyCode == RIGHT)
  {
    branchAngle *= 1.1;
  }
  if (keyCode == LEFT)
  {
    branchAngle *= 0.9;
  }
}

void Branch(float x, float y, float angle, int iter, float _length)
{
  pushMatrix();
  translate(x, y);
  PVector dest = new PVector(0, -_length);
  dest.rotate(angle);
  strokeWeight(iter);
  line(0, 0, dest.x, dest.y);
  if (iter > 0) 
  {
    Branch(dest.x, dest.y, angle + branchAngle, iter - 1, _length * branchFalloff);
    Branch(dest.x, dest.y, angle - branchAngle, iter - 1, _length * branchFalloff);
  }
  popMatrix();
}
