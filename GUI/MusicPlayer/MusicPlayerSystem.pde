class MusicPlayerSystem
{
  Song First;
  Song Index;
  User FirstU;
  User IndexU;
<<<<<<< Updated upstream
  User firstUser;
  User indexUser;
  Set<String> genreTracker = new HashSet<>();

=======
  User curUser;
  PrintWriter newUser;
>>>>>>> Stashed changes

  MusicPlayerSystem()
  {
  }

   void AddSong(String id, String title, String artist, String genre, String beatpm, String tag1, String tag2, String tag3) {
    if (First ==null) {
      First = new Song(id, title, artist, genre, beatpm, tag1, tag2, tag3);

      Index=First;
    } else {
      Song aSong = new Song(id, title, artist, genre, beatpm, tag1, tag2, tag3);
      Index.sNext = aSong;
      Index = aSong;
    }
   }

  void appendNewSongToFile() {
    Song s = SearchSong("100");
    AddSong(s.ID, s.TITLE, s.ARTIST, s.GENRE, s.BEATpm, s.tag1, s.tag2, s.tag3);
    PrintWriter output;
    output = createWriter("data/Songsdatabase.txt");

    if (SongList!=null) {
      for (String line : SongList) {
        output.println(line);
      }
    }
    output.println(s.ID + ", " + s.TITLE +", " + s.ARTIST + ", " + s.GENRE + ", "+s.BEATpm+", "+s.tag1+", "+s.tag2 + ", " + s.tag3);
    output.flush();
    output.close();
  }



  void removeSong(String sAttribute) {
    if (First == null) {
      return;
    }
    Song sToRemove = new Song(SearchSong(sAttribute).ID,
      SearchSong(sAttribute).TITLE,
      SearchSong(sAttribute).ARTIST,
      SearchSong(sAttribute).GENRE,
      SearchSong(sAttribute).BEATpm,
      SearchSong(sAttribute).tag1,
      SearchSong(sAttribute).tag2,
      SearchSong(sAttribute).tag3);
    if (sToRemove==null) {
      return;
    }
    if (First.ID.equals(sToRemove.ID)) {
      First = First.sNext;
      return;
    }
    Song Index = First;
    while (Index.sNext !=null) {
      if (Index.sNext.ID.equals(sToRemove.ID)) {
        Index.sNext = Index.sNext.sNext;
        return;
      }
      Index=Index.sNext;
    }
  }






  void generateSuggestions(String UserID, String playlistID) {
<<<<<<< Updated upstream
    // Find the current user
    User currUser = user1;
    while (currUser != null && !currUser.UID.equals(UserID)) {
      currUser = currUser.uNext;
    }

    Playlist currPlaylist;
    if (currUser != null) {
      currPlaylist = currUser.p;
    } else {
      currPlaylist = null;
    }

    if (currUser == null || currPlaylist == null) {
      println("User or Playlist not found.");
      return; // User or Playlist not found
    }

    // Step 1: Analyze genres and artists in the given playlist
    Set<String> genresInPlaylist = new HashSet<>();
    Set<String> artistsInPlaylist = new HashSet<>();
    Song currSong = currPlaylist.First;

    while (currSong != null) {
      genresInPlaylist.add(currSong.GENRE);
      artistsInPlaylist.add(currSong.ARTIST);
      currSong = currSong.sNext;
    }

    // Step 2: Look for similar songs in the user's library
    Set<Song> suggestedSongs = new HashSet<>();
    currSong = First;

    while (currSong != null) {
      // Suggest if song is not in the playlist and matches genre or artist
      if (!currPlaylist.Contains(currSong.ID) &&
        (genresInPlaylist.contains(currSong.GENRE) ||
        artistsInPlaylist.contains(currSong.ARTIST))) {
        suggestedSongs.add(currSong);
      }
      currSong = currSong.sNext;
    }

    // Step 3: Print suggestions
    if (!suggestedSongs.isEmpty()) {
      println("Suggested Songs for " + currUser.username + ":");
      for (Song song : suggestedSongs) {
        println(song.GENRE + " by " + song.ARTIST + "," + song.TITLE);
      }
    } else {
      println("No suggestions available for " + currUser.username + ".");
=======
    User currUser = SearchUser(UserID);
    Playlist currPlaylist = currUser.SearchPlaylist(playlistID);
    if (currUser == null||currPlaylist==null) {
      return;
    }

    Song currSong = currPlaylist.First;
  }

  Song SearchSong(String Att) {
    Index = First;
    while (IndexU!=null) {
      if (IndexU.UID.equals(Att)) {
        //||
        //Index.TITLE.equals(Att)||
        //Index.ARTIST.equals(Att)||
        //Index.GENRE.equals(Att)||
        //Index.BEATpm.equals(Att)

        return Index;
      } else if (IndexU.uNext==null) {
        continue;
      } else {
        IndexU = IndexU.uNext;
      }
>>>>>>> Stashed changes
    }
  }
<<<<<<< Updated upstream
    boolean mathcesGenreOrArtist(Song song, String[] genres, int genreCount, String[]artist, int artistCount) {
      for (int i=0; i<genreCount; i++) {
        if (song.GENRE.equals(genres[i])) {
          return true;
        }
      }
      for (int i=0; i<artistCount; i++) {
        if (song.ARTIST.equals(artist[i])) {
          return true;
        }
      }
      return false;
    }
    Song SearchSong(String Att) {
      Index = First;
      while (Index!=null) {
        if (Index.ID.equals(Att)) {

          return Index;
        } else if (Index.sNext==null) {
          println("NotFound");
        } else {
          Index = Index.sNext;
        }
      }
      return null;
    }

    User SearchUser(String Att) {
      IndexU = FirstU;
      while (IndexU!=null) {
        if (IndexU.UID.equals(Att)) {

          return IndexU;
        } else if (IndexU.uNext==null) {
          println("NotFound");
        } else {
          IndexU = IndexU.uNext;
        }
      }
      return null;
    }
    void addUser(String name, String pw, String UID)
    {
      if (firstUser == null)
      {
        User FirstU = new User(name, pw, UID);
        IndexU = FirstU;
        PrintWriter uFile;
        uFile = createWriter("data/Users/" + UID + ".txt");
        uFile.println(name + ", " + pw + ", " + UID);
        uFile.flush();
        uFile.close();
      } else
      {
        User aUser = new User(name, pw, UID);
        IndexU.uNext = aUser;
        IndexU = aUser;
        createWriter("data/Users/" + UID + ".txt");
        PrintWriter uFile;
        uFile = createWriter("data/Users/" + UID + ".txt");
        uFile.println(name + ", " + pw + ", " + UID);
        uFile.flush();
        uFile.close();
=======

  String UID(String Username)
  {
    IndexU=FirstU;
    while (IndexU!=null)
    {
      if (IndexU.username.equals(Username))
      {
        return IndexU.UID;
      } else
      {
        IndexU=IndexU.uNext;
      }
    }
    return "";
  }

  User SearchUser(String userID) {
    IndexU = FirstU;
    while (IndexU!=null) {
      if (IndexU.UID.equals(userID)) {
        return IndexU;
      } else if (IndexU.uNext==null) {
        println("NotFound");
      } else {
        IndexU = IndexU.uNext;
>>>>>>> Stashed changes
      }
    }
  }
<<<<<<< Updated upstream
=======
  void createUser(String firstName, String lastName, String email, String username, String password, String UID)
  {
    println(UID);
    String[]info={firstName, lastName, email, username, password, UID};
    newUser=createWriter("/data/Users/"+username+"/"+username+".txt");
    for (int i=0; i<info.length; i++)
    {
      newUser.println(info[i]);
    }
    newUser.flush();
    newUser.close();
    addUser(info[0], info[1], info[2], info[3], info[4], UID);
  }

  void addUser(String firstName, String lastName, String email, String username, String password, String UID)
  {
    if (FirstU==null)
    {
      User newUser=new User(firstName, lastName, email, username, password, UID);
      curUser=newUser;
      FirstU=newUser;
    } else
    {
      IndexU=FirstU;
      while (IndexU!=null)
      {
        if (IndexU.uNext==null)
        {
          User newUser=new User(firstName, lastName, email, username, password, UID);
          curUser=newUser;
          IndexU.uNext=newUser;
          break;
        } else
        {
          IndexU=IndexU.uNext;
        }
      }
    }
  }

  void editInfo()
  {
  }

  void addToLib(Song s)
  {
    curUser.addLib(s);
    PrintWriter library;
    File temp;
    temp=new File(dataPath("/Users/"+curUser.username+"/library.txt"));
    String[]songsInLib=loadStrings(temp);
    library=createWriter(dataPath("/Users/"+curUser.username+"/library.txt"));
    if (songsInLib!=null)
      for (int i=0; i<songsInLib.length; i++)
      {
        library.println(songsInLib[i]);
      }
    library.println(s.ID+", " +s.TITLE+", " +s.ARTIST+", "+s.GENRE+", "+s.BEATpm+", "+s.tag1+", "+s.tag2+", "+s.tag3);
    library.flush();
    library.close();
  }

  void removeFromLib(Song s)
  {
    curUser.removeLib(s);
    PrintWriter library;
    File temp;
    temp=new File(dataPath("/Users/"+curUser.username+"/library.txt"));
    String[]songsInLib=loadStrings(temp);
    for (int i=0; i<songsInLib.length; i++)
    {
      String []info=songsInLib[i].split(",");
      String title=info[1].trim();
      String artist=info[2].trim();
      if (s.TITLE.equals(title)&&s.ARTIST.equals(artist))
      {
        songsInLib[i]="";
        library=createWriter(dataPath("/Users/"+curUser.username+"/library.txt"));
        for (int j=0; j<songsInLib.length; j++)
        {
          if (!songsInLib[j].equals(""))
            library.println(songsInLib[j]);
        }
        library.flush();
        library.close();
        break;
      }
    }
  }

  void setLib()
  {
    File curUserLib=new File(dataPath("/Users/"+curUser.username+"/library.txt"));
    String[]userLibSongs=loadStrings(curUserLib);
    if (userLibSongs!=null)
      for (String p : userLibSongs)
      {
        String[]sAttributes=p.split(",");
        Song temp=new Song(sAttributes[0].trim(), sAttributes[1].trim(), sAttributes[2].trim(), sAttributes[3].trim(), sAttributes[4].trim(), sAttributes[5].trim(), sAttributes[6].trim(), sAttributes[7].trim()) ;
        curUser.addLib(temp);
        system.lib.add(sAttributes[1].trim());
      }
  }

  void reset()
  {
    curUser.libraryFirst=null;
  }
}
>>>>>>> Stashed changes
