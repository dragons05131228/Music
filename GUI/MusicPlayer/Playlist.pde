class Playlist {

  SongDatabase database;

  Song First;
  Song Index;

  Playlist pNext;

  int counter;
  Playlist(SongDatabase database) {
    this.database=database;
  }

  void AddSongPlaylist(String sAttribute) {
    Song sTemp = database.SearchSong(sAttribute);
    First = sTemp;
    if (sTemp !=null) {
     Song newSong = new Song(sTemp.ID,sTemp.TITLE,sTemp.ARTIST,sTemp.GENRE,sTemp.BEATpm);
      if(First == null){
        First = newSong;
      }
        Index=First;
    } else {
      Song aSong = sTemp;
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
