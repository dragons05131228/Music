class User
{
  SongDatabase ds;
  Playlist p;
  Playlist PFirst;
  Playlist PList;
  
  User()
  {
    ds   = new SongDatabase();
    p = new Playlist(this.ds);
  }
  
  void playlist(){
    p.AddSongPlaylist("80");
     p.AddSongPlaylist("20");
    //p.AddSongPlaylist("10");
    //p.AddSongPlaylist("30");
    //p.AddSongPlaylist("40");
    //p.AddSongPlaylist("50");
     p.PrintlAll();
  }
  
  //void 
}
