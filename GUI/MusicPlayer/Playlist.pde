class Playlist {

  SongDatabase database;

  Song First;
  
  Playlist pNext;

  int counter;
  Playlist(SongDatabase database) {
    this.database=database;
  }

  void AddSongPlaylist(String sAttribute) {
    Song Index;
    Song sTemp = new Song(database.SearchSong(sAttribute).ID,
    database.SearchSong(sAttribute).TITLE,
    database.SearchSong(sAttribute).ARTIST,
    database.SearchSong(sAttribute).GENRE,
    database.SearchSong(sAttribute).BEATpm);
if(First==null){
  First = sTemp;
}
else{
  Index = First;
  while(Index.sNext!=null){
    Index=Index.sNext;
  }
    Index.sNext=sTemp;
  }
}
  
  void removeSong(String sAttribute){
    Song Index;
 Song sTemp = new Song(database.SearchSong(sAttribute).ID,
    database.SearchSong(sAttribute).TITLE,
    database.SearchSong(sAttribute).ARTIST,
    database.SearchSong(sAttribute).GENRE,
    database.SearchSong(sAttribute).BEATpm);
  
}

 void PrintlAll() {
   Song Index;
    Index = First;
    while (Index!=null)
    {
      println(Index.ID);
      Index=Index.sNext;
    }
  }

  
}
