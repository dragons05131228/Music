import java.util.*;
int stage=0;
Set<String>usernames=new HashSet<String>();
GUI system=new GUI();
float lastMouseX, lastMouseY;
String[] SongList;
MusicPlayerSystem mps;
int uFolderSize;
File userFolder;
File[] uFiles;
float transy;
SongDatabase ds=new SongDatabase();
void setup() {
  SongList = loadStrings("SongsDatabase.txt");
  size(800, 1000);
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
