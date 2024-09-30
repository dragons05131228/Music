int stage=0;
GUI system=new GUI();
User us = new User();
float lastMouseX, lastMouseY;

void setup() {
  size(800, 1000);
  initialize();
  system.userLoginPage();
}

void draw() {

  if (stage==0)
  {
    userLoginPage();
  }

}
void userLoginPage()
{
  background(255);
  textSize(80);
  fill(0);
  textAlign(CENTER);
  text("Music Player", 400, 200);
  system.display();
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
  if (stage==0)
  {
    system.checkBox(mouseX, mouseY);
    Box temp=system.grabbedBox();
    if (temp==null)return;
    if (temp.type=="Submit")
    {
      system.checkInfo();
    }
  }
}

void keyReleased()
{
  Box temp=system.grabbedBox();
  if (temp==null)return;
  println(temp.bName);
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
