class Song {

  Song sNext;
  Song next;
  int VIEWS = 0;
  String ID;
  String TITLE;
  String ARTIST;
  String GENRE;
  String BEATpm;
  String tag1;
  String tag2;
  String tag3;
  Box button;

  Song (String ID, String TITLE, String ARTIST, String GENRE, String BEATpm, String tag1, String tag2, String tag3) {
    sNext = null;
    this.ID = ID;
    this.TITLE = TITLE;
    this.ARTIST = ARTIST;
    this. GENRE = GENRE;
    this.BEATpm = BEATpm;
    this.tag1 = tag1;
    this.tag2 = tag2;
    this.tag3 = tag3;
  }

  void Update() {
  }

  void display(int y)
  {
    textSize(18);
    fill(0);
    textAlign(CENTER);
    text(TITLE+"\n"+"By: "+ARTIST+"\n", 210, y*70+300);
    text(GENRE, 480, y*70+310);
    text(BEATpm, 580, y*70+310);
    if (!system.lib.contains(TITLE))
    {
      fill(0, 255, 0);
      text("ADD TO LIBRARY", 690, y*70+310);
    } else
    {
      fill( 255, 0, 0);
      text("REMOVE FROM LIBRARY", 690, y*70+310);
    }
  }
}
