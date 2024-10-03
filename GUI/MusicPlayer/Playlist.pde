class Playlist {

  SongDatabase database;

  Song First;
  
  Playlist pNext;

  int counter;
  Playlist(SongDatabase database) {
    this.database=database;
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
