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
    p.AddSongPlaylist("55");
     p.AddSongPlaylist("56");
     p.PrintlAll();
  }
}
