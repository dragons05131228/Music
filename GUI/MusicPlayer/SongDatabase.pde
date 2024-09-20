class SongDatabase {

  Song First;
  Song Index;



  SongDatabase() {
  }



  void AddSong(String id, String title, String artist, String genre, String beatpm) {
    if (First ==null) {
      First = new Song(id, title, artist, genre, beatpm);

      Index=First;
    } else {
      Song aSong = new Song(id, title, artist, genre, beatpm);
      Index.sNext = aSong;
      Index = aSong;
    }
  }


  void PrintlAll() {
    Index = First;
    while (Index!=null)
    {
      println(Index.ID);
      Index=Index.sNext;
    }
  }
}
