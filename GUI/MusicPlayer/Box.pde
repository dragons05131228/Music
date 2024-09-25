class Box
{
  PVector pos;
  String bName;
  String type;
  int len;
  int wid;
  color c;
  String input="";
  Box next;

  Box(float x, float y, int rectSizeX, int rectSizeY, String bName, String type, color c)
  {
    pos=new PVector(x, y);
    len=rectSizeX;
    wid=rectSizeY;
    this.bName=bName;
    this.type=type;
    this.c=c;
  }

  void display()
  {
    fill(c);
    rect(pos.x, pos.y, len, wid);
    if (type=="Submit")
    {
      fill(0);
      textSize(20);
      textAlign(CENTER);
      text(type, pos.x+0.5*len, pos.y+0.5*wid+5);
    }
    if (type=="Input")
    {
      fill(0);
      textSize(20);
      textAlign(CORNER);
      text(input, pos.x+10, pos.y+0.5*wid+5);
    }
  }

  boolean mouseOver(float mousex, float mousey)
  {
    if (mousex>pos.x&&mousex<pos.x+len&&mousey>pos.y&&mousey<pos.y+wid)
      return true;
    return false;
  }

  void highlight(float mousex, float mousey)
  {
    if (type=="Input")
    {
      if (mouseOver(mousex, mousey))
      {
        c=color(255);
      } else
      {
        c=color(200);
      }
    }
  }
}
