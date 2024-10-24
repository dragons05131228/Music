class SongDatabase {

  Song First;
  Song Index;
  int totalSongs;

  SongDatabase() {
  }
  void printAll() {
    Index = First;
    while (Index!=null)
    {
      println(Index.TITLE);
      Index=Index.next;
    }
  }

  void display()
  {
    Index=First;
    int posx=0;
    int posy=0;

    while (Index!=null)
    {

      textAlign(CORNER);
      Index.button.display();
      Index.display(posx*370+40, 300*posy+130);
      posx++;
      if (posx==2)
      {
        posy++;
        posx=0;
      }
      Index=Index.next;
    }
  }

  void add(Song s)
  {
    if (First==null)
    {
      First=s;
      Index=s;
    } else
    {
      Index.next=s;
      Index=Index.next;
    }
  }

  void initDatabase()
  {
    String[] files=loadStrings("SongsDatabase.txt");
    totalSongs=files.length;
    String[] initViews = new String[1000];
    String[] songStats = loadStrings("songStats.txt");
    for (int i=0; i<initViews.length; i++)
    {
      String tempStats[] = songStats[i].split(",");
      String views = tempStats[0].trim();
      initViews[i] = views;
    }
    for (int i=0; i<files.length; i++)
    {
      String p[]=files[i].split(",");
      Song temp=new Song(p[0].trim(), p[1].trim(), p[2].trim(), p[3].trim(), p[4].trim(), p[5].trim(), p[6].trim(), p[7].trim(), initViews[i]);
      add(temp);
    }
  }

  void setMainButton()
  {
    Index=First;
    int posx=0;
    int posy=0;
    while (Index!=null)
    {
      Index.button=new Box(posx*370+215, 300*posy+325, 180, 40, "AddSong", "Submit", color(255), color(0));
      posx++;
      if (posx==2)
      {
        posy++;
        posx=0;
      }
      Index=Index.next;
    }
  }

  Song grabbedSong()
  {
    Index=First;
    while (Index!=null)
    {
      if (Index.button.mouseOver(mouseX, mouseY))
      {
        return Index;
      } else
        Index=Index.next;
    }
    return null;
  }
}
