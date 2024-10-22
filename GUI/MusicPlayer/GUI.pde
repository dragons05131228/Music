class GUI
{
  Box firstBox;
  Box boxIterator;
  boolean showPassword;
  boolean showError;
  boolean showMenu;
  int error;
  Set<String>lib=new HashSet<String>();

  String[] errors={"Please Fill In The Missing Blanks", "Invalid Email", "Username Must Be A Minimum Of 5 Characters", "Password Must Be A Minimum Of 8 Characters", "Passwords Are Not The Same", "Invalid Username Or Password", "Username Already Exists"};

  GUI()
  {
  }

  //STAGES
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------

  void stages()
  {
    if (stage==0)
      uLoginPage();
    if (stage==1)
      registerPage();
    if (stage==2)
      userPage();
    if (stage==3)
      library();
    if (stage==4)
      playlists();
    if (stage==5)
      accountInfo();
    if (stage==6)
      logout();
    if (stage==7)
      createPlaylistPage();
  }

  void logout()
  {
    stage=0;
    resetBoxes();
    userLoginBoxes();
    lib.clear();
    mps.reset();
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

  //USER BOXES
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------
  void menuBoxes()
  {
    system.addBox(20, 70, 50, 50, "Menu", "Submit", color(255), color(0));
    system.addBox(0, 40, 300, 100, "Browse", "Submit", color(255, 255, 255, 0), color(255, 255, 255, 0));
    system.addBox(0, 140, 300, 100, "Library", "Submit", color(255, 255, 255, 0), color(255, 255, 255, 0));
    system.addBox(0, 240, 300, 100, "Playlists", "Submit", color(255, 255, 255, 0), color(255, 255, 255, 0));
    system.addBox(0, 340, 300, 100, "AccountInfo", "Submit", color(255, 255, 255, 0), color(255, 255, 255, 0));
    system.addBox(0, 440, 300, 100, "Logout", "Submit", color(255, 255, 255, 0), color(255, 255, 255, 0));
  }
  void userLoginBoxes()
  {
    system.addBox(545, 480, 55, 50, "showPassword", "Hover", color(255, 255, 255, 0), color(255, 255, 255, 0));
    system.addBox(200, 400, 400, 50, "Username", "Input", color(200), 0);
    system.addBox(200, 480, 400, 50, "Password", "Input", color(200), 0);
    system.addBox(350, 560, 100, 40, "Login", "Submit", color(240), 0);
    system.addBox(240, 670, 260, 30, "Register", "Submit", color(255, 255, 255, 0), color(255, 255, 255, 0));
  }

  void regPageBoxes()
  {
    system.addBox(340, 330, 320, 50, "firstName", "Input", color(200), 0);
    system.addBox(340, 400, 320, 50, "lastName", "Input", color(200), 0);
    system.addBox(340, 470, 320, 50, "email", "Input", color(200), 0);
    system.addBox(340, 540, 320, 50, "createUsername", "Input", color(200), 0);
    system.addBox(340, 610, 320, 50, "createPassword", "Input", color(200), 0);
    system.addBox(340, 680, 320, 50, "confirmPassword", "Input", color(200), 0);
    system.addBox(350, 800, 100, 40, "regComplete", "Submit", color(240), 0);
  }

  void mainPageBoxes()
  {
    system.addBox(100, 70, 600, 50, "searchBox", "Input", color(200), color(0));
    menuBoxes();
  }

  void playListBoxes()
  {
    menuBoxes();
    system.addBox(600, 70, 150, 50, "createPlaylist", "Submit", color(255), color(0));
  }

  void libraryPageBoxes()
  {
    menuBoxes();
  }

  void cPlaylistBoxes()
  {
  }
  //USER DISPLAY
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------

  void displayMenu()
  {
    for (int i=0; i<3; i++)
    {
      fill(0);
      rect(30, i*10+80, 30, 5);
    }
    if (showMenu==true)
    {
      stroke(0);
      fill(255);
      rect(0, transy, 300, 1000);
      fill(0);
      textSize(30);
      textAlign(CENTER);
      text("Hello "+mps.curUser.firstName+"!", 150, 35);
      line(0, 40, 300, 40);
      textAlign(CORNER);
      text("Browse", 10, 100);
      text("Library", 10, 200);
      text("Playlists", 10, 300);
      text("Account Info", 10, 400);
      text("Logout", 10, 500);
    }
  }

  void uLoginPage()
  {
    background(255);
    fill(0);
    display();
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
    stroke(0);
    line(250, 700, 500, 700);
    textSize(20);
    text("SHOW", 545, 510);
    Box hover=system.hoverBox();
    if (hover!=null&&hover.bName.equals("showPassword"))
    {
      if (hover.type.equals("Hover"))
      {
        showPassword=true;
      }
    } else
      showPassword=false;
    if (showError==true)
    {
      textAlign(CENTER);
      textSize(20);
      fill(255, 0, 0);
      text(errors[error], 400, 640);
    }
  }

  void registerPage()
  {
    background(255);
    textSize(80);
    textAlign(CENTER);
    fill(0);
    text("Registration Form", 400, 200);
    display();
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
    background(255);
    display();
    textSize(20);
    if (searchBox("searchBox").input.equals(""))
    {
      fill(255);
      textAlign(CORNER);
      text("Search for your favorite song, artist, or genre", 120, 100);
    }
    fill(0);
    //text("Welcome " + mps.curUser.firstName+"!", 100, 400);
    fill(255);
    stroke(0);
    for (int i=0; i<ds.totalSongs+1; i++)
    {
      rect(20, i*70+200, 380, 70);
      rect(400, i*70+200, 160, 70);
      rect(560, i*70+200, 40, 70);
    }
    stroke(0);
    rect(600, 200, 180, 70);
    textSize(18);
    fill(0);
    textAlign(CENTER);
    text("Add/Remove Song", 690, 240);
    text("Song Title and Song Artist", 210, 240);
    text("Genre", 480, 240);
    text("BPM", 580, 240);
    ds.display();
    displayMenu();
  }

  void playlists()
  {
    background(255);
    display();
    textAlign(CENTER);
    fill(0);
    if (mps.curUser.PFirst==null)
    {
      textSize(40);
      text("No Playlists Yet.\n Create One To View Them Here", 400, 400);
    }
    textSize(20);
    text("Create Playlist", 675, 100);
    displayMenu();
  }

  void createPlaylistPage()
  {
    background(255);
  }

  void accountInfo()
  {
    background(255);
  }

  void library()
  {
    background(255);
    display();
    mps.curUser.libDisplay();
    displayMenu();
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

  Box searchBox(String boxName)
  {
    boxIterator = firstBox;
    while (boxIterator!=null) {
      if (boxIterator.bName.equals(boxName)) {
        return boxIterator;
      } else if (boxIterator.next==null) {
        break;
      } else {
        boxIterator = boxIterator.next;
      }
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
  void checkBox()
  {
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
      if (!boxIterator.type.equals("Input"))
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

  boolean checkInfo(String userInfo, String passInfo)
  {
    String u=searchBox(userInfo).input;
    String p=searchBox(passInfo).input;
    if (stage==0)
    {
      if ((mps.UID(u)).equals("")||!p.equals(mps.SearchUser(mps.UID(u)).password))
      {
        error=5;
        showError=true;
        return false;
      } else
      {
        resetBoxes();
        mps.curUser=mps.SearchUser(mps.UID(u));
        showError=false;
        mainPageBoxes();
        for (int i=0; i<uFiles.length; i++)
        {
          if (uFiles[i].getName().equals(u+".txt"))
          {
            File temp=uFiles[i];
            String[] info=loadStrings(temp);
            println(info[0]);
            break;
          }
        }
        return true;
      }
    }
    return false;
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

  //GUI INTERACTIONS
  //---------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------
  void guiMouseReleased()
  {
    lastMouseX=mouseX;
    lastMouseY=mouseY;
    checkBox();
    Box temp=grabbedBox();

    
    if (stage==0)
    {
      if (temp==null)return;
      println(temp.bName);
      if (temp.type.equals("Submit"))
      {
        if (checkInfo("Username", "Password"))
        {
          stage=2;
          ds.setMainButton();
          mps.setLib();
        }
      }
      if (temp.bName.equals("Register"))
      {
        resetBoxes();
        stage=1;
        regPageBoxes();
        showError=false;
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
          } else if (!searchBox("email").input.contains("@")||!searchBox("email").input.contains("."))
          {
            showError=true;
            error=1;
          } else if (searchBox("createUsername").input.length()<5)
          {
            showError=true;
            error=2;
          } else if (searchBox("createPassword").input.length()<8)
          {
            showError=true;
            error=3;
          } else if (!searchBox("createPassword").input.equals(searchBox("confirmPassword").input))
          {
            showError=true;
            error=4;
          } else if (usernames.contains(searchBox("createUsername").input))
          {
            showError=true;
            error=6;
          } else
          {
            showError=false;
            userFolder=new File(dataPath("/Users"));
            uFiles=userFolder.listFiles();
            File newFolder=new File(dataPath("/Users/"+searchBox("createUsername").input));
            newFolder.mkdirs();
            String[]info={searchBox("firstName").input, searchBox("lastName").input, searchBox("email").input, searchBox("createUsername").input, searchBox("createPassword").input};
            mps.createUser(info[0], info[1], info[2], info[3], info[4], str(uFiles.length));
            resetBoxes();
            mainPageBoxes();
            ds.setMainButton();
            stage=2;
          }
        }
    }
    if (stage==2||searchBox("Menu")!=null)
    {
      if (mouseX>300&&showMenu)
        showMenu=false;
      if (ds.grabbedSong()!=null)
      {
        Song a=ds.grabbedSong();
        if (!lib.contains(a.TITLE))
        {
          Song t=new Song(a.ID, a.TITLE, a.ARTIST, a.GENRE, a.BEATpm, a.tags[0], a.tags[1], a.tags[2], a.views);
          mps.addToLib(t);
          lib.add(a.TITLE);
        } else
        {
          Song t=new Song(a.ID, a.TITLE, a.ARTIST, a.GENRE, a.BEATpm, a.tags[0], a.tags[1], a.tags[2], a.views);
          mps.removeFromLib(t);
          lib.remove(a.TITLE);
        }
      }
      if (grabbedBox()==null)return;
      if (mouseX>0&&mouseX<300&&mouseY>40&&mouseY<140&&showMenu)
      {
        resetBoxes();
        mainPageBoxes();
        showMenu=false;
        stage=2;
      } else if (grabbedBox().bName.equals("Library")&&showMenu)
      {
        showMenu=false;
        resetBoxes();
        libraryPageBoxes();
        stage=3;
      } else if (grabbedBox().bName.equals("Playlists")&&showMenu)
      {
        showMenu=false;
        resetBoxes();
        playListBoxes();
        stage=4;
      } else if (grabbedBox().bName.equals("AccountInfo")&&showMenu)
      {
        showMenu=false;
        resetBoxes();
        stage=5;
      } else if (grabbedBox().bName.equals("Logout")&&showMenu)
      {
        showMenu=false;
        stage=6;
      } else if (!showMenu)
      {
        if (grabbedBox().bName.equals("Menu"))
          showMenu=true;
      }
    }
    if (stage==4)
    {
      if (grabbedBox()==null)return;
      if (grabbedBox().bName.equals("createPlaylist"))
      {
        stage=7;
      }
    }
  }
}
