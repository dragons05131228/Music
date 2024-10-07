class Playlist {

  SongDatabase database;

  Song First;
  
  Playlist pNext;
String PID;
  int counter;
  Playlist(SongDatabase database,String PID) {
    this.database=database;
    this.PID = PID;
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
