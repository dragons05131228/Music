import java.util.*;
int stage=0;
GUI system=new GUI();
String username="admin";
String password="admin";
float lastMouseX, lastMouseY;
String[] SongList;
User user1 = new User("user", "0", "1");
MusicPlayerSystem mps;
void setup() {
  SongList = loadStrings("SongsDatabase.txt");
  size(800, 1000);
  initialize();
  
     //user1.playlistPrint();

    //user1.mps.generateSuggestions(user1.UID, user1.p.PID);

  //us.ds.appendNewSongToFile();
  //us.playlistPrint();
  system.userLoginBoxes();
  mps = new MusicPlayerSystem();
  mps.addUser("test", "test", "0");
  mps.addUser("test1", "test1", "1");
  mps.addUser("test2", "test2", "2");
  system.userLoginBoxes();

}

void draw() {
  system.stages();
}

void UserLinkedList() {
}

void adminPage()
{
  background(0);
}


void initialize() {

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
     user1.mps.AddSong(id, title, artist, genre, beatpm, tag1, tag2, tag3);
  } 
}

void mouseReleased()
{
  system.guiMouseReleased();
}

void keyTyped()
{
  Box temp=system.grabbedBox();
  if (temp==null)return;
  if (temp.type=="Input")
  {
    if (keyCode!=SHIFT&&keyCode!=ALT&&keyCode!=CONTROL&&keyCode!=UP&&keyCode!=DOWN&&keyCode!=LEFT&&keyCode!=RIGHT&&key!=BACKSPACE&&keyCode!=TAB&&keyCode!=ENTER)
      system.getInput(key);
    else if (key==BACKSPACE)
    {
      system.backspace();
    }
  }
}
