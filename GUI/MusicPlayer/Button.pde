class Button
{
  PVector pos;
  PVector size;

  Button(float x, float y, float sx, float sy)
  {
    pos = new PVector(x, y);
    size = new PVector(sx, sy);
  }

  void update()
  {
    display();
  }

  void display()
  {
    rect(pos.x, pos.y, size.x, size.y);
  }
}
