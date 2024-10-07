class GUI
{
  Box firstBox;
  Box boxIterator;
  User firstUser;
  User userIterator;
  boolean showPassword;
  boolean showError;
  int error;
  String[] errors={ "Please Fill In The Missing Blanks", "Invalid Email", "Password Must Be A Minimum Of 8 Characters", "Passwords Are Not The Same", "Invalid Username", "Invalid Password"};

  GUI()
  {
  }

  //STAGES
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------

  void stages()
  {

    if (stage==-2)
    {
      adminPage();
    }
    if (stage==-1)
    {
      aLoginPage();
    }
    if (stage==0)
    {
      uLoginPage();
    }
    if (stage==1)
    {
      registerPage();
    }
  }

  //BOX MODIFICATION
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------
  void addBox(float x, float y, int rectSizeX, int rectSizeY, String bName, String type, color c, color stroke)
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
  //USER BOXES
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------

  void userLoginBoxes()
  {
    system.addBox(545, 480, 55, 50, "showPassword", "Hover", color(255, 255, 255, 0), color(255, 255, 255, 0));
    system.addBox(200, 400, 400, 50, "Username", "Input", color(200), 0);
    system.addBox(200, 480, 400, 50, "Password", "Input", color(200), 0);
    system.addBox(350, 560, 100, 40, "Login", "Submit", color(240), 0);
    system.addBox(240, 670, 260, 30, "Register", "Submit", color(255, 255, 255, 0), color(255, 255, 255, 0));
    system.addBox(650, 900, 100, 50, "adminLogin", "Submit", color(255), 0);
  }

  void regPageBoxes()
  {
    system.addBox(340, 330, 320, 50, "firstName", "Input", color(200), 0);
    system.addBox(340, 400, 320, 50, "LastName", "Input", color(200), 0);
    system.addBox(340, 470, 320, 50, "Email", "Input", color(200), 0);
    system.addBox(340, 540, 320, 50, "createUsername", "Input", color(200), 0);
    system.addBox(340, 610, 320, 50, "createPassword", "Input", color(200), 0);
    system.addBox(340, 680, 320, 50, "confirmPassword", "Input", color(200), 0);
    system.addBox(350, 800, 100, 40, "regComplete", "Submit", color(240), 0);
  }

  //USER DISPLAY
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------

  void uLoginPage()
  {
    background(255);
    system.display();
    fill(0);
    textAlign(CENTER);
    textSize(80);
    text("Music Player", 400, 200);
    textSize(20);
    text("Submit", 400, 585);
    textSize(40);
    text("Login", 400, 380);
    textSize(25);
    textAlign(CORNER);
    text("New User? Register Here", 250, 700);
    line(250, 700, 500, 700);
    text("Admin", 665, 930);
    textSize(20);
    text("SHOW", 545, 510);
    Box hover=system.hoverBox();
    if (hover!=null&&hover.bName.equals("showPassword"))
    {
      if (hover.type.equals("Hover"))
      {
        system.showPassword=true;
      }
    } else
      system.showPassword=false;
  }
  void aLoginPage()
  {
    background(0);
    stroke(255);
    textSize(60);
    textAlign(CENTER);
    fill(255);
    text("Admin", 400, 200);
    textSize(30);
    textAlign(CORNER);
    text("Username:\n\nPassword:", 180, 380);
    system.display();
    textSize(20);
    text("Submit", 400, 515);
  }
  void registerPage()
  {
    background(255);
    textSize(80);
    textAlign(CENTER);
    fill(0);
    text("Registration Form", 400, 200);
    system.display();
    fill(0);
    textSize(20);
    text("Submit", 400, 825);
    textSize(30);
    text("First Name:\n\nLast Name:\n\nEmail:\n\nCreate Username:\n\nCreate Password:\n\nConfirm Password:", 210, 360);
    if (showError==true)
    {
      textSize(20);
      fill(255, 0, 0);
      text(errors[error], 400, 900);
    }
  }

  void userPage()
  {
  }

  //ADMIN PAGES
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------
  void adminLoginBoxes()
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

  void displayError(String s)
  {
    if (showError==true)
    {
      text(s, 400, 900);
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
  Box hoverBox()
  {
    boxIterator=firstBox;
    while ( boxIterator!=null)
    {
      if ( boxIterator.mouseOver(mouseX, mouseY))
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
  boolean checkInputs()
  {
    boxIterator=firstBox;
    while (boxIterator!=null)
    {
      if (boxIterator.type!="Input")
      {
        boxIterator=boxIterator.next;
        continue;
      } else
      {
        if (boxIterator.input.equals(""))
        {
          return false;
        } else
        {
          boxIterator=boxIterator.next;
        }
      }
    }
    return true;
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
    if (grabbedBox().input.length()<=30)
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
    checkBox(mouseX, mouseY);
    Box temp=grabbedBox();
    if (stage==-1)
    {
      if (temp==null)return;
      println(temp.bName);
      if (temp.bName=="aLogin")
      {
        if (checkInfo())
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
        if (checkInfo())
        {
          stage=2;
        }
      }
      if (temp.bName.equals("adminLogin"))
      {
        resetBoxes();
        stage=-1;
        adminLoginBoxes();
      }
      if (temp.bName.equals("Register"))
      {
        resetBoxes();
        stage=1;
        regPageBoxes();
      }
    }
    if (stage==1)
    {
      if (grabbedBox()!=null)
        if (grabbedBox().type.equals("Submit"))
        {
          if (!checkInputs())
          {
            showError=true;
            error=0;
          } else if (!searchBox("Email").input.contains("@")||!searchBox("Email").input.contains("."))
          {
            showError=true;
            error=1;
          } else if (searchBox("createPassword").input.length()<8)
          {
            showError=true;
            error=2;
          } else if (!searchBox("createPassword").input.equals(searchBox("confirmPassword").input))
          {
            showError=true;
            error=3;
          } else
            showError=false;
        }
    }
  }

  void mouseOver()
  {
  }
}
