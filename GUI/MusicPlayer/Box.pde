class Box
{
  PVector pos;
  String bName;
  String type;
  int len;
  int wid;
  color stroke;
  color c;
  String input="";
  Box next;

  Box(float x, float y, int rectSizeX, int rectSizeY, String bName, String type, color c, color stroke)
  {
    pos=new PVector(x, y);
    len=rectSizeX;
    wid=rectSizeY;
    this.bName=bName;
    this.type=type;
    this.stroke=stroke;
    this.c=c;
  }

  void display()
  {
    fill(c);
    stroke(stroke);
    rect(pos.x, pos.y, len, wid);
    if (type=="Submit")
    {
      textAlign(CENTER);
      fill(0);
    }
    if (type=="Input")
    {
      fill(0);
      textSize(15);
      textAlign(CORNER);
      if (!bName.equals("Password")&&!bName.equals("aPassword"))
        text(input, pos.x+10, pos.y+0.5*wid+5);
      else
      {
        if (system.showPassword)
        {
          text(input, pos.x+10, pos.y+0.5*wid+5);
        } else
          for (int i=0; i<input.length(); i++)
          {
            text("*", pos.x+10+i*10, pos.y+0.5*wid+5);
          }
      }
    }
    if (type=="Hover")
    {
      noFill();
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
