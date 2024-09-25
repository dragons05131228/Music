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
     newSong.sNext=null;
      if(First == null){
        First = newSong;
      
        Index=First;
        Index.sNext=null;
      }
     else {
      Song aSong = new Song(newSong.ID,newSong.TITLE,newSong.ARTIST,newSong.GENRE,newSong.BEATpm);
      Index.sNext = aSong;
      Index = aSong;
      Index.sNext=null;
    }
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
