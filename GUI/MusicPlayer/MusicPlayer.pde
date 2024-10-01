int stage=0;
GUI system=new GUI();
User us = new User();
float lastMouseX, lastMouseY;

void setup() {
  size(800, 1000);
  initialize();
  system.userLoginPage();
  us.playlist();
}

void draw() {

  println(mouseX, mouseY);
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
    register();
  }
}
void uLoginPage()
{
  background(255);
  textSize(80);
  fill(0);
  textAlign(CENTER);
  text("Music Player", 400, 200);
  system.display();
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
  text("Submit", 400, 515);
}

void register()
{
  background(255);
}

void initialize() {
  String[] SongList = loadStrings("SongsDatabase.txt");

  for (String line : SongList) {
    String[] SongInfo = line.split(",");
    String id = SongInfo[0].trim();
    String title = SongInfo[1].trim();
    String artist = SongInfo[2].trim();
    String genre = SongInfo[3].trim();
    String beatpm = SongInfo[4].trim();
    String tag1 = SongInfo[5].trim();
    String tag2 = SongInfo[6].trim();
    String tag3 = SongInfo[7].trim();
    us.ds.AddSong(id, title, artist, genre, beatpm, tag1, tag2, tag3);
  }
}

void mouseReleased()
{
  system.checkBox(mouseX, mouseY);
  Box temp=system.grabbedBox();
  if (stage==-1)
  {
    if (temp==null)return;
    println(temp.bName);
  }
  if (stage==0)
  {
    if (temp==null)return;
    println(temp.bName);
    if (temp.type=="Submit")
    {
      system.checkInfo();
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

void keyReleased()
{
  Box temp=system.grabbedBox();
  if (temp==null)return;
  if (temp.type=="Input")
  {
    if (keyCode!=SHIFT&&keyCode!=ALT&&keyCode!=CONTROL&&keyCode!=UP&&keyCode!=DOWN&&keyCode!=LEFT&&keyCode!=RIGHT&&key!=BACKSPACE&&keyCode!=TAB)
      system.getInput(key);
    else if (key==BACKSPACE)
    {
      system.backspace();
    }
  }
}
