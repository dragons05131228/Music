class SongDatabase {

  Song First;
  Song Index;



  SongDatabase() {
  }



  void AddSong(String id, String title, String artist, String genre, String beatpm,String tag1,String tag2, String tag3) {
    if (First ==null) {
      First = new Song(id, title, artist, genre, beatpm,tag1,tag2,tag3);

      Index=First;
    } else {
      Song aSong = new Song(id, title, artist, genre, beatpm,tag1,tag2,tag3);
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



  Song SearchSong(String Att) {
    Index = First;
    while (Index!=null) {
      if (Index.ID.equals(Att)){
        //||
        //Index.TITLE.equals(Att)||
        //Index.ARTIST.equals(Att)||
        //Index.GENRE.equals(Att)||
        //Index.BEATpm.equals(Att)
        
        return Index;
      } else if (Index.sNext==null) {
        println("NotFound");
      } else {
        Index = Index.sNext;
      }
    }
    return null;
  }
}
