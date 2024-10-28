class Playlist {

  Song first;
  Song index;
  Playlist pNext;
  Box button;
  String PID;
  String name;
  Set<String>songs=new HashSet<String>();

  Playlist(String name, String PID) {
    this.name=name;
    this.PID = PID;
  }
  boolean Contains(String songID) {
    index = first;
    while (index != null) {
      if (index.ID.equals(songID)) {
        return true;
      }
      index = index.sNext;
    }
    return false;
  }
  void PrintAll() {
    Song index;
    index = first;
    while (index!=null)
    {
      println(index.ID);
      index=index.sNext;
    }
  }

  Playlist(SongDatabase database, String PID) {
    this.database=database;
    this.PID = PID;
  }
  
  void display(int posy)
  {
    if (button!=null)
      button.display();
    textSize(30);
    fill(0);
    text(name, 400, posy*70+285);
  }

  void songDisplay()
  {
    index=first;
    int posy=0;
    while (index!=null)
    {
      index.button.display();
      index.display(posy, 370);
      posy++;
      index=index.next;
    }
  }

  void addSong(Song t)
  {
    if (first==null)
    {
      first=t;
      index=first;
    } else
    {
      index=first;
      while (index!=null)
      {
        if (index.next==null)
        {
          index.next=t;
          break;
        } else
          index=index.next;
      }
    }
  }

  void setButton()
  {
    index=first;
    int posy=0;
    while (index!=null)
    {
      index.button=new Box(600, posy*70+340, 180, 70, "removeSong", "Submit", color(255), color(0));
      posy++;
      index=index.next;
    }
  }

  Song grabbedSong()
  {
    index=first;
    while (index!=null)
    {
      if (index.button.mouseOver(mouseX, mouseY))
      {
        return index;
      }
      index=index.next;
    }
    return null;
  }

  void removeFirst()
  {
    index=first.next;
    first=null;
    first=index;
  }

  void removeLast()
  {
    index=first;
    while (index!=null)
    {
      if (index.next.next==null)
      {
        index.next=null;
        break;
      } else
        index=index.next;
    }
  }

  void removeIndex(String sname)
  {
    index=first;
    while (index!=null)
    {
      if (first.TITLE.equals(sname))
      {
        removeFirst();
        break;
      } else if (index.next==null&&index.TITLE.equals(sname))
      {
        removeLast();
        break;
      } else if (index.next.TITLE.equals(sname))
      {
        index.next=index.next.next;
        break;
      } else
        index=index.next;
    }
  }
}
}
