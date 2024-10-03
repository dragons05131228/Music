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

  //BOX MODIFICATION
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------
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

  Box searchBox(String boxName)
  {
    boxIterator = firstBox;
    while (boxIterator!=null) {
      if (boxIterator.bName.equals(boxName)) {
        return boxIterator;
      } else if (boxIterator.next==null) {
        println("NotFound");
      } else {
        boxIterator = boxIterator.next;
      }
    }
    return null;
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
    system.addBox(330, 420, 300, 50, "aPassword", "Input", color(200), 255);
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

  boolean checkInfo()
  {
    if (stage==-1)
    {
      Box bUserName=searchBox("aUserName");
      Box bPassword=searchBox("aPassword");
      if (bUserName.input.equals(username)&&bPassword.input.equals(password))
      {
        return true;
      }
    }
    return false;
  }

  //GUI INTERACTIONS
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------
  void guiMouseReleased()
  {
    system.checkBox(mouseX, mouseY);
    Box temp=system.grabbedBox();
    if (stage==-1)
    {
      if (temp==null)return;
      println(temp.bName);
      if (temp.bName=="aLogin")
      {
        if (system.checkInfo())
        {
          stage=-2;
        }
      }
    }
    if (stage==0)
    {
      if (temp==null)return;
      println(temp.bName);
      if (temp.type=="Submit")
      {
        if (system.checkInfo())
        {
          stage=2;
        }
      }
      if (temp.bName.equals("adminLogin"))
      {
        stage=-1;
        system.resetBoxes();
        system.adminLoginPage();
      }
      if (temp.bName.equals("Register"))
      {
        stage=1;
        system.resetBoxes();
      }
    }
    if (stage==1)
    {
    }
  }
}
