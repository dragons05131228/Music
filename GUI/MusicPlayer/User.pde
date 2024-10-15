class User
{
Playlist p;
  Playlist PFirst;
  Playlist PIndex;
  MusicPlayerSystem mps;
  User uNext;
  
  Song LibFirst;
  Song LibIndex;
  String username;
  String password;
  String UID;

  User(String name, String pw, String UID)
  {
    mps   = new MusicPlayerSystem();
    p = new Playlist(this.mps,str(1));
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
  
  
  void playlistPrint() {
    
    p.AddSongPlaylist("1");
    p.AddSongPlaylist("2");
    p.AddSongPlaylist("3");
 p.AddSongPlaylist("4");
    p.AddSongPlaylist("5");
    p.AddSongPlaylist("6");
     p.AddSongPlaylist("7");
    p.AddSongPlaylist("8");
    p.AddSongPlaylist("9");
    //mps.removeSong("9");
    p.PrintlAll();
  }
}
