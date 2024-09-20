class Song {

  Song sNext;

  int VIEWS = 0;
  String ID;
  String TITLE;
  String ARTIST;
  String GENRE;
  String BEATpm;
  ArrayList<String>Meta=new ArrayList<String>();

  Song (String ID, String TITLE, String ARTIST, String GENRE, String BEATpm) {
    sNext = null;
    this.ID = ID;
    this.TITLE = TITLE;
    this.ARTIST = ARTIST;
    this. GENRE = GENRE;
    this.BEATpm = BEATpm;
  }

  void Update() {
  }

  void DisplaySongs() {
    println(ID + ", " + TITLE + ", " + GENRE);
  }
}
