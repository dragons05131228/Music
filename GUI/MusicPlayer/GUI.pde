class GUI
{
  Box firstBox;
  Box iterator;

  GUI()
  {
  }

  void addBox(float x, float y, int rectSizeX, int rectSizeY, String bName, String type, color c)
  {
    if (firstBox==null)
    {
      firstBox=new Box(x, y, rectSizeX, rectSizeY, bName, type, c);
      iterator=firstBox;
    } else
    {
      Box temp=new Box(x, y, rectSizeX, rectSizeY, bName, type, c);
      iterator.next=temp;
      iterator=temp;
    }
  }

  void userLoginPage()
  {
    system.addBox(250, 400, 300, 50, "Username", "Input", color(200));
    system.addBox(250, 480, 300, 50, "Password", "Input", color(200));
    system.addBox(350, 560, 100, 40, "Login", "Submit", color(240));
  }

  void display()
  {
    iterator=firstBox;
    while (iterator!=null)
    {
      iterator.display();
      iterator=iterator.next;
    }
  }

  Box grabbedBox()
  {
    iterator=firstBox;
    while (iterator!=null)
    {
      if (iterator.mouseOver(lastMouseX, lastMouseY))
      {
        return iterator;
      }
      iterator=iterator.next;
    }
    return null;
  }

  void checkBox(float mousex, float mousey)
  {
    lastMouseX=mousex;
    lastMouseY=mousey;
    iterator=firstBox;
    while (iterator!=null)
    {
      iterator.highlight(lastMouseX, lastMouseY);
      println(iterator.mouseOver(lastMouseX, lastMouseY));
      iterator=iterator.next;
    }
  }

  void getInput(char in)
  {
    if (grabbedBox().input.length()<=30)
      grabbedBox().input+=in;
  }

  void backspace()
  {
    Box temp=grabbedBox();
    if (temp.input.length()>0)
      temp.input=temp.input.substring(0, temp.input.length()-1);
  }

  void checkInfo()
  {
  }
}
