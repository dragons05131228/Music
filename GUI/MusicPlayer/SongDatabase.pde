class SongDatabase {

  Song First;
  Song Index;



  SongDatabase() {

  }



  



  void PrintlAll() {
    Index = First;
    while (Index!=null)
    {
      Index=Index.sNext;
    }
  }



  
}
