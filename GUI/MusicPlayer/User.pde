class User
{
  SongDatabase ds;
  Playlist p;
  Playlist PFirst;
  Playlist PIndex;
  User uNext;
  Song libraryFirst;
  Song libraryIndex;


  String firstName, lastName, email;
  String username;
  String password;

  String UID;

  User(String firstName, String lastName, String email, String username, String password, String UID)
  {
    ds   = new SongDatabase();
    p = new Playlist(this.ds, str(1));
    this.username = username;
    this.password = password;
    this.firstName=firstName;
    this.lastName=lastName;
    this.email=email;
    this.UID = UID;
  }

  Playlist SearchPlaylist(String Att) {
    PIndex = PFirst;
    while (PIndex!=null) {
      if (PIndex.PID.equals(Att)) {
        return PIndex;
      } else if (PIndex.pNext==null) {
        println("NotFound");
      } else {
        PIndex = PIndex.pNext;
      }
    }
    return null;
  }

  void addLib(Song s)
  {
    if (libraryFirst==null)
    {
      println("True");
      libraryFirst=s;
      libraryIndex=libraryFirst;
    } else
    {
      libraryIndex=libraryFirst;
      while (libraryIndex!=null)
      {
        if (libraryIndex.next==null)
        {
          libraryIndex.next=s;
          break;
        } else
          libraryIndex=libraryIndex.next;
      }
    }
  }

  void removeLib(Song s)
  {
    libraryIndex=libraryFirst;
    while (libraryIndex!=null)
    {
      if (compare(libraryFirst, s))
      {
        removeFirst();
        break;
      } else if (libraryIndex.next==null&&compare(libraryIndex, s))
      {
        removeLast();
        break;
      } else if (compare(libraryIndex.next, s))
      {
        libraryIndex.next=libraryIndex.next.next;
        break;
      } else
        libraryIndex=libraryIndex.next;
    }
  }
  void removeFirst()
  {
    libraryIndex=libraryFirst.next;
    libraryFirst=null;
    libraryFirst=libraryIndex;
  }

  void removeLast()
  {
    libraryIndex=libraryFirst;
    while (libraryIndex!=null)
    {
      if (libraryIndex.next.next==null)

        break;
      else
        libraryIndex=libraryIndex.next;
    }
    libraryIndex.next=null;
  }

  boolean compare(Song one, Song two)
  {
    if (one.TITLE.equals(two.TITLE)&&one.ARTIST.equals(two.ARTIST))
      return true;
    return false;
  }

  void libDisplay()
  {
    libraryIndex=libraryFirst;
    if (libraryIndex==null)
      println("null");
    else
      println("working");
    int posy=0;
    while (libraryIndex!=null)
    {
      //libraryIndex.button.display();
      textAlign(CORNER);
      libraryIndex.display(300*posy+130);
      posy++;
      libraryIndex=libraryIndex.next;
    }
  }
}
