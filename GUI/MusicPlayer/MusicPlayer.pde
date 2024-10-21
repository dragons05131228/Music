import java.util.*;
int stage=0;
Set<String>usernames=new HashSet<String>();
GUI system=new GUI();
float lastMouseX, lastMouseY;
String[] songList;
String[] songStats;
User user1 = new User("user", "0", "1", "test", "test", "test");
MusicPlayerSystem mps;
int uFolderSize;
File userFolder;
File[] uFiles;
float transy;
SongDatabase ds=new SongDatabase();
void setup() {
  songList = loadStrings("SongsDatabase.txt");
  size(800, 1000);
  initialize();
  
     //user1.playlistPrint();

    //user1.mps.generateSuggestions(user1.UID, user1.p.PID);

  //us.ds.appendNewSongToFile();
  //us.playlistPrint();
  system.userLoginBoxes();
  mps = new MusicPlayerSystem();
  system.userLoginBoxes();
  userFolder=new File(dataPath("/Users"));
  uFiles=userFolder.listFiles();
  ds.initDatabase();
  UserLinkedList();
}

void draw() {
  background(255);
  translate(0, transy);
  system.stages();
}

void UserLinkedList()
{
  background(0);
}


void initialize() {
 
  
  for (String line : songList) {
    String[] songInfo = line.split(",");
    String id = songInfo[0].trim();
    String title = songInfo[1].trim();
    String artist = songInfo[2].trim();
    String genre = songInfo[3].trim();
    String beatpm = songInfo[4].trim();
    String tag1 = songInfo[5].trim();
    String tag2 = songInfo[6].trim();
    String tag3 = songInfo[7].trim();
    //user1.mps.AddSong(id, title, artist, genre, beatpm, tag1, tag2, tag3);
  } 
  for (int i=0; i<uFiles.length; i++)
  {
    //First Name, Last Name,Email,Username, Password, UID
    File temp=new File(dataPath("/Users/"+uFiles[i].getName()));
    File[]tempArray=temp.listFiles();
    String name=temp.getName()+".txt";
    for (int j=0; j<tempArray.length; j++)
    {
      if (tempArray[j].getName().equals(name))
      {
        String aUserInfo[]=loadStrings(tempArray[j]);
        mps.addUser(aUserInfo[0].trim(), aUserInfo[1].trim(), aUserInfo[2].trim(), aUserInfo[3].trim(), aUserInfo[4].trim(), aUserInfo[5].trim());
        usernames.add(aUserInfo[3]);
        break;
      }
    }
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
  if (temp.type.equals("Input"))
  {
    if (keyCode!=SHIFT&&keyCode!=ALT&&keyCode!=CONTROL&&keyCode!=UP&&keyCode!=DOWN&&keyCode!=LEFT&&keyCode!=RIGHT&&key!=BACKSPACE&&keyCode!=TAB&&keyCode!=ENTER)
      system.getInput(key);
    else if (key==BACKSPACE)
    {
      system.backspace();
    }
  }
}
void mouseWheel(MouseEvent event)
{
  float e=event.getCount();
  if (stage==2)
    transy+=e*40;
}
