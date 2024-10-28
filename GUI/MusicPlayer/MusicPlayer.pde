import java.util.*;
int stage=0;
Set<String>usernames=new HashSet<String>();
GUI system=new GUI();
float lastMouseX, lastMouseY;
String[] songList;
String[] songStats;
MusicPlayerSystem mps;
int uFolderSize;
File userFolder;
File[] uFiles;
float transy;
SongDatabase ds=new SongDatabase();

void setup() {
  songStats = loadStrings("songStats.txt");
  songList = loadStrings("SongsDatabase.txt");
  size(800, 1000);
  system.userLoginBoxes();
  mps = new MusicPlayerSystem();
  userFolder=new File(dataPath("/Users"));
  uFiles=userFolder.listFiles();
  ds.initDatabase();
  mps.initAdds();
  mps.checkAdds();
  UserLinkedList();
}

void draw() {
  background(255);
  translate(0, transy);
  system.stages();
  mps.eventGeneration();
}

void UserLinkedList()
{
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
  if (temp.type.equals("numBox"))
  {
    if (key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'||key=='9'||key=='0')
    {
      system.getInput(key);
    }
  }
}
void mouseWheel(MouseEvent event)
{
  if (stage<2||system.showMenu)return;
  float e=event.getCount();
  transy=constrain(transy, -1000000, -40);
  transy+=e*40;
}
