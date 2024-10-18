class Playlist {

<<<<<<< Updated upstream
  MusicPlayerSystem mp;

  Song First;
      Song Index;

=======
  SongDatabase database;
  Song First;
>>>>>>> Stashed changes
  Playlist pNext;
  String PID;
  int counter;
<<<<<<< Updated upstream
  Playlist(MusicPlayerSystem mp,String PID) {
    this.mp=mp;
    this.PID = PID;
  }
  
  void AddSongPlaylist(String sAttribute) {
    Song sTemp = new Song(mp.SearchSong(sAttribute).ID,
      mp.SearchSong(sAttribute).TITLE,
     mp.SearchSong(sAttribute).ARTIST,
      mp.SearchSong(sAttribute).GENRE,
      mp.SearchSong(sAttribute).BEATpm,
      mp.SearchSong(sAttribute).tag1,
      mp.SearchSong(sAttribute).tag2,
      mp.SearchSong(sAttribute).tag3);
    if (First==null) {
      First = sTemp;
    } else {
      Index = First;
      while (Index.sNext!=null) {
        Index=Index.sNext;
      }
      Index.sNext=sTemp;
    }
  }
  
  
 
boolean Contains(String songID){
  Index = First;
  while(Index != null){
    if(Index.ID.equals(songID)){
      return true;
    }
    Index = Index.sNext;
  }
  return false;
}
 void PrintlAll() {
   Song Index;
=======
  Playlist(SongDatabase database, String PID) {
    this.database=database;
    this.PID = PID;
  }

  void PrintAll() {
    Song Index;
>>>>>>> Stashed changes
    Index = First;
    while (Index!=null)
    {
      println(Index.ID);
      Index=Index.sNext;
    }
  }
}
