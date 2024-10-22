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
  String views;
  String similarities;
  Box button;

  Song (String ID, String TITLE, String ARTIST, String GENRE, String BEATpm, String tag1, String tag2, String tag3, String views) {
    sNext = null;
    this.ID = ID;
    this.TITLE = TITLE;
    this.ARTIST = ARTIST;
    this. GENRE = GENRE;
    this.BEATpm = BEATpm;
    tags[0] = tag1;
    tags[1] = tag2;
    tags[2] = tag3;
    this.views = views;
    similarities = "";
  }

  void Update() {
  }

  void display(int x, int y)
  {
    String newString="";
    textSize(20);
    fill(0);
    if (ARTIST.length()>17)
    {
      String[]split=ARTIST.split(" ");
      for (int i=0; i<split.length; i++)
      {
        newString+=split[i]+" ";
        if (i==2)
          newString+="\n";
      }
      text(TITLE+"\n\n"+"By: "+newString+"\n\n"+GENRE, x+160, y+50);
    } else
    {
      text(TITLE+"\n\n"+"By: "+ARTIST+"\n\n"+GENRE, x+160, y+50);
    }
    if (stage==2&&!system.lib.contains(TITLE))
    {
      text("ADD TO LIBRARY", x+200, y+220);
    } else if (stage==2)
    {
      text("IN LIBRARY", x+200, y+220);
    } else if (stage==3)
    {
      if (mps.curUser.PFirst!=null)
      {
        text("ADD TO PLAYLIST", x+200, y+220);
      }
    }
  }
}
