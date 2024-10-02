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

void appendNewSongToFile(){
  Song s =  SearchSong("100");
   AddSong(s.ID, s.TITLE,s.ARTIST, s.GENRE,s.BEATpm,s.tag1,s.tag2,s.tag3);
  PrintWriter output;
  output = createWriter("data/Songsdatabase.txt");
  
  if(SongList!=null){
    for(String line:SongList){
      output.println(line);
    }
  }
  output.println(s.ID + ", " + s.TITLE +", " + s.ARTIST + ", " + s.GENRE + ", "+s.BEATpm+", "+s.tag1+", "+s.tag2 + ", " + s.tag3);
  output.flush();
  output.close();
}

  void PrintlAll() {
    Index = First;
    while (Index!=null)
    {
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
