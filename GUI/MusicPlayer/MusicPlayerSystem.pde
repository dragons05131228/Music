class MusicPlayerSystem
{
  Song First;
  Song Index;
  User FirstU;
  User IndexU;
  User firstUser;
  User indexUser;
  Set<String> genreTracker = new HashSet<>();


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
    }
  }
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
      }
    }
  }
