class Song {

  Song sNext;
  Song next;
  int VIEWS = 0;
  String ID;
  String TITLE;
  String ARTIST;
  String GENRE;
  String BEATpm;
  String[] tags = new String[3];
  String adds;
  String similarities;
  Box button;
  boolean initAdds;

  Song (String ID, String TITLE, String ARTIST, String GENRE, String BEATpm, String tag1, String tag2, String tag3, String adds) {
    sNext = null;
    this.ID = ID;
    this.TITLE = TITLE;
    this.ARTIST = ARTIST;
    this. GENRE = GENRE;
    this.BEATpm = BEATpm;
    tags[0] = tag1;
    tags[1] = tag2;
    tags[2] = tag3;
    this.adds = adds;
    similarities = "";
    initAdds = false;
  }

  void Update() {
  }

  void display(int y, int c)
  {
    textSize(18);
    fill(0);
    textAlign(CENTER);
    text(TITLE+"\n"+"By: "+ARTIST+"\n", 210, y*70+c);//300
    text(GENRE, 480, y*70+c+10);//310
    text(BEATpm, 580, y*70+c+10);//310
    if (stage==2)
    {
      if (!system.lib.contains(TITLE))
      {
        fill(0, 255, 0);
        text("ADD TO LIBRARY", 690, y*70+c+10);//310
      } else
      {
        fill(0);
        text("IN LIBRARY", 690, y*70+c+10);//310
      }
    }
    if (stage==3)
    {
      fill(255, 0, 0);
      text("REMOVE FROM LIBRARY", 690, y*70+310);
    }
    if (stage==8)
    {
      fill(255, 0, 0);
      textSize(15);
      text("REMOVE FROM PLAYLIST", 690, y*70+380);
    }
    if (stage==9)
    {
      fill(#00C49A);
      if (!system.curPlaylist.songs.contains(TITLE))
        text("ADD TO PLAYLIST", 690, y*70+340);
      else
      {
        fill(0);
        text("IN PLAYLIST", 690, y*70+340);
      }
    }
  }
  }
}
