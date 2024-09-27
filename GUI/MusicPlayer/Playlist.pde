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
