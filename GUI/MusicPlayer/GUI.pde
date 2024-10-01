class GUI
{
  Box firstBox;
  Box boxIterator;
  User firstUser;
  User userIterator;
  boolean showPassword;

  GUI()
  {
  }

  void addBox(float x, float y, int rectSizeX, int rectSizeY, String bName, String type, color c, int stroke)
  {
    if (firstBox==null)
    {
      firstBox=new Box(x, y, rectSizeX, rectSizeY, bName, type, c, stroke);
      boxIterator=firstBox;
    } else
    {
      Box temp=new Box(x, y, rectSizeX, rectSizeY, bName, type, c, stroke);
      boxIterator.next=temp;
      boxIterator=temp;
    }
  }
  //USER PAGES
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------

  void userLoginPage()
  {
    system.addBox(200, 400, 400, 50, "Username", "Input", color(200), 0);
    system.addBox(200, 480, 400, 50, "Password", "Input", color(200), 0);
    system.addBox(350, 560, 100, 40, "Login", "Submit", color(240), 0);
    system.addBox(250, 680, 250, 20, "Register", "Submit", color(255, 255, 255, 0), 255);
    system.addBox(650, 900, 100, 50, "adminLogin", "Submit", color(255), 0);
  }

  void regPage()
  {
  }

  //ADMIN PAGES
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------
  void adminLoginPage()
  {
    system.addBox(330, 350, 300, 50, "aUserName", "Input", color(200), 255);
    system.addBox(330, 420, 300, 50, "aPassWord", "Input", color(200), 255);
    system.addBox(350, 490, 100, 40, "aLogin", "Submit", color(255), 0);
  }

  //DISPLAY
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------
  void display()
  {
    boxIterator=firstBox;
    while ( boxIterator!=null)
    {
      boxIterator.display();
      boxIterator= boxIterator.next;
    }
  }

  //CHECKING BOXES
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------
  Box grabbedBox()
  {
    boxIterator=firstBox;
    while ( boxIterator!=null)
    {
      if ( boxIterator.mouseOver(lastMouseX, lastMouseY))
      {
        return  boxIterator;
      }
      boxIterator= boxIterator.next;
    }
    return null;
  }

  void checkBox(float mousex, float mousey)
  {
    lastMouseX=mousex;
    lastMouseY=mousey;
    boxIterator=firstBox;
    while ( boxIterator!=null)
    {
      boxIterator.highlight(lastMouseX, lastMouseY);
      //println(iterator.mouseOver(lastMouseX, lastMouseY));
      boxIterator= boxIterator.next;
    }
  }

  //RESETS
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------

  void resetBoxes()
  {
    firstBox=null;
  }

  //TEXT BASE INPUTS
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------
  void getInput(char in)
  {
    if (grabbedBox().input.length()<=28)
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
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------
}
