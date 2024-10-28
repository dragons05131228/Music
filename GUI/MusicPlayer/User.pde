class User
{
  Playlist p;
  Playlist PFirst;
  Playlist PIndex;
  User uNext;
  Song libraryFirst;
  Song libraryIndex;
  Set<String>pNames=new HashSet<String>();


  String firstName, lastName, email;
  String username;
  String password;

  String UID;

  User(String firstName, String lastName, String email, String username, String password, String UID)
  {
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

  void addPlaylist(Playlist p)
  {
    if (PFirst==null)
    {
      PFirst=p;
      PIndex=PFirst;
    } else
    {
      PIndex=PFirst;
      while (PIndex!=null)
      {
        if (PIndex.pNext==null)
        {
          PIndex.pNext=p;
          break;
        } else
          PIndex=PIndex.pNext;
      }
    }
  }
  void addLib(Song s)
  {
    println(libraryFirst);
    if (libraryFirst==null)
    {
      //println("adding..." + s.TITLE);
      //println("True");
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
  void setLibButton(int space)
  {
    libraryIndex=libraryFirst;
    int posy=2;
    while (libraryIndex!=null)
    {
      libraryIndex.button=new Box(600, 70*posy+space, 180, 70, libraryIndex.TITLE, "Submit", color(255), color(0));//130
      posy++;
      libraryIndex=libraryIndex.next;
    }
  }

  Song grabbedLibSong()
  {
    libraryIndex=libraryFirst;
    while (libraryIndex!=null)
    {
      if (libraryIndex.button.mouseOver(mouseX, mouseY))
      {
        return libraryIndex;
      } else
        libraryIndex=libraryIndex.next;
    }
    return null;
  }

  void displayPlaylists()
  {
    PIndex=PFirst;
    int posy=0;
    while (PIndex!=null)
    {
      PIndex.display(posy);
      posy++;
      PIndex=PIndex.pNext;
    }
  }


  void setPlaylistButton()
  {
    PIndex=PFirst;
    int posy=0;
    while (PIndex!=null)
    {
      PIndex.button=new Box(100, posy*70+250, 600, 50, "editPlaylist", "Submit", color(240), color(255, 255, 255, 0));
      posy++;
      PIndex=PIndex.pNext;
    }
  }

  Playlist grabbedPlaylist()
  {
    PIndex=PFirst;
    while (PIndex!=null)
    {
      if (PIndex.button.mouseOver(mouseX, mouseY))
      {
        return PIndex;
      } else
        PIndex=PIndex.pNext;
    }
    return null;
  }
}
