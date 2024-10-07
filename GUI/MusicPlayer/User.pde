class User
{
  SongDatabase ds;
  Playlist p;
  Playlist PFirst;
  Playlist PIndex;
  MusicPlayerSystem mps;
  User uNext;
  
  String username;
  String password;
  String UID;

  User(String name, String pw, String UID)
  {
    ds   = new SongDatabase();
    p = new Playlist(this.ds,str(1));
    username = name;
    password = pw;
    this.UID = UID;
  }
 Playlist SearchPlaylist(String Att) {
    PIndex = PFirst;
    while (PIndex!=null) {
      if (PIndex.PID.equals(Att)) {

        return PIndex;
      } else if (PIndex.pNext==null) {
        println("NotFound");
      } else {
        PIndex = PIndex.pNext;
      }
    }
    return null;
  }
  //void playlistPrint() {
  //  //p.AddSongPlaylist("80");
  //  //p.AddSongPlaylist("20");
  //  //p.AddSongPlaylist("10");
  //  //p.AddSongPlaylist("30");
  //  //p.AddSongPlaylist("40");
  //  //p.AddSongPlaylist("50");
  //  mps.AddSongPlaylist("83");
  //  mps.AddSongPlaylist("83");
  //  mps.AddSongPlaylist("83");

  //  //p.PrintlAll();
  //  //p.removeSong("20");
  //  mps.removeSong("83");

  //  p.PrintlAll();
  //}
}
