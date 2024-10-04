class User
{
  SongDatabase ds;
  Playlist p;
  Playlist PFirst;
  Playlist PList;
  MusicPlayerSystem mps;
  User uNext;
  
  String username;
  String password;

  User(String name, String pw)
  {
    ds   = new SongDatabase();
    p = new Playlist(this.ds);
    username = name;
    password = pw;
  }

  void playlistPrint() {
    //p.AddSongPlaylist("80");
    //p.AddSongPlaylist("20");
    //p.AddSongPlaylist("10");
    //p.AddSongPlaylist("30");
    //p.AddSongPlaylist("40");
    //p.AddSongPlaylist("50");
    mps.AddSongPlaylist("83");
    mps.AddSongPlaylist("83");
    mps.AddSongPlaylist("83");

    //p.PrintlAll();
    //p.removeSong("20");
    mps.removeSong("83");

    p.PrintlAll();
  }
}
