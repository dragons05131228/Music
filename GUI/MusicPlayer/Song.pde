class Song {

  Song sNext;

  int VIEWS = 0;
  String ID;
  String TITLE;
  String ARTIST;
  String GENRE;
  String BEATpm;
  String tag1;
  String tag2;
  String tag3;
  ArrayList<String>Meta=new ArrayList<String>();

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

  void DisplaySongs() {
    println(ID + ", " + TITLE + ", " + GENRE);
  }
}
