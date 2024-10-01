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
    database.SearchSong(sAttribute).BEATpm,
     database.SearchSong(sAttribute).tag1,
      database.SearchSong(sAttribute).tag2,
       database.SearchSong(sAttribute).tag3);
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
    if(First == null){
      return;
    }
 Song sToRemove = new Song(database.SearchSong(sAttribute).ID,
    database.SearchSong(sAttribute).TITLE,
    database.SearchSong(sAttribute).ARTIST,
    database.SearchSong(sAttribute).GENRE,
    database.SearchSong(sAttribute).BEATpm,
     database.SearchSong(sAttribute).tag1,
      database.SearchSong(sAttribute).tag2,
       database.SearchSong(sAttribute).tag3);
    if(sToRemove==null){
      return;
    }
  if(First.ID.equals(sToRemove.ID)){
    First = First.sNext;
    return;
  }
      Song Index = First;
      while(Index.sNext !=null){
        if(Index.sNext.ID.equals(sToRemove.ID)){
          Index.sNext = Index.sNext.sNext;
          return;
        }
        Index=Index.sNext;
      }
}

 void PrintlAll() {
   Song Index;
    Index = First;
    while (Index!=null)
    {
      Index=Index.sNext;
    }
  }

  
}
