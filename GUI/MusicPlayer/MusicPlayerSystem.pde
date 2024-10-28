class MusicPlayerSystem
{
  Song First;
  Song Index;
  User FirstU;
  User IndexU;
  User firstUser;
  User indexUser;
  Set<String> genreTracker = new HashSet<>();
  User curUser;
  PrintWriter newUser;
  String[] songStatIDs = new String[1000];
  float eventTimer;

  MusicPlayerSystem()
  {
    eventTimer = millis();
  }

  void AddSong(String id, String title, String artist, String genre, String beatpm, String tag1, String tag2, String tag3, String adds) {
    if (First ==null) {
      First = new Song(id, title, artist, genre, beatpm, tag1, tag2, tag3, adds);

      Index=First;
    } else {
      Song aSong = new Song(id, title, artist, genre, beatpm, tag1, tag2, tag3, adds);
      Index.sNext = aSong;
      Index = aSong;
    }
  }

  //void appendNewSongToFile() {
  //  Song s = SearchSong("100");
  //  AddSong(s.ID, s.TITLE, s.ARTIST, s.GENRE, s.BEATpm, s.tags[0], s.tags[1], s.tags[2], s.views);
  //  PrintWriter output;
  //  output = createWriter("data/Songsdatabase.txt");

  //  if (SongList!=null) {
  //    for (String line : SongList) {
  //      output.println(line);
  //    }
  //  }
  //  output.println(s.ID + ", " + s.TITLE +", " + s.ARTIST + ", " + s.GENRE + ", "+s.BEATpm+", "+s.tag1+", "+s.tag2 + ", " + s.tag3);
  //  output.flush();
  //  output.close();
  //}



  void removeSong(String sAttribute) {
    if (First == null) {
      return;
    }
    Song sToRemove = new Song(SearchSong(sAttribute).ID,
      SearchSong(sAttribute).TITLE,
      SearchSong(sAttribute).ARTIST,
      SearchSong(sAttribute).GENRE,
      SearchSong(sAttribute).BEATpm,
      SearchSong(sAttribute).tags[0],
      SearchSong(sAttribute).tags[1],
      SearchSong(sAttribute).tags[2],
      SearchSong(sAttribute).adds);
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






   //void generateSuggestions(String UserID, String playlistID) {
   // // Find the current user
   // User currUser = user1;
   // while (currUser != null && !currUser.UID.equals(UserID)) {
   //   currUser = currUser.uNext;
   // }

   // Playlist currPlaylist;
   // if (currUser != null) {
   //   currPlaylist = currUser.p;
   // } else {
   //   println("User or Playlist not found.");
   //   return; // User or Playlist not found
   // }

   // // Step 1: Analyze genres, BEATpms, and tags in the given playlist
   // Set<String> genresInPlaylist = new HashSet<>();
   // Set<String> artistsInPlaylist = new HashSet<>();
   // Set<String> tagsInPlaylist = new HashSet<>();
   // Set<Integer> BEATpmsInPlaylist = new HashSet<>();
   // Song currSong = currPlaylist.First;

   // while (currSong != null) {
   //   genresInPlaylist.add(currSong.GENRE);
   //   artistsInPlaylist.add(currSong.ARTIST);

   //   // Convert BEATpm to integer and check if it's in range
   //   int BEATpm = Integer.parseInt(currSong.BEATpm);

   //   BEATpmsInPlaylist.add(BEATpm);


   //   for (String tag : currSong.tags) {
   //     tagsInPlaylist.add(tag);
   //   }
   //   currSong = currSong.sNext;
   // }

   // // Step 2: Look for similar songs in the user's library
   // Set<Song> suggestedSongs = new HashSet<>();
   // currSong = First; // Assuming 'First' points to the first song in the user's library

   // while (currSong != null) {
   //   if (!currPlaylist.Contains(currSong.ID)) {
   //     StringBuilder similarities = new StringBuilder();
   //     int matchCount = 0;

   //     // Check for matching genre
   //     if (genresInPlaylist.contains(currSong.GENRE)) {
   //       similarities.append("Genre: ").append(currSong.GENRE);
   //       matchCount++;
   //       currSong.wgt = currSong.wgt+40;
   //     }

   //     // Check for matching artist
   //     //if (artistsInPlaylist.contains(currSong.ARTIST)) {
   //     //    if (similarities.length() > 0) {
   //     //        similarities.append(", ");
   //     //    }
   //     //    similarities.append("Artist: ").append(currSong.ARTIST);
   //     //    matchCount++;
   //     //    currSong.wgt = currSong.wgt+10;
   //     //}

   //     // Check for matching BEATpm
   //     int currBEATpm = Integer.parseInt(currSong.BEATpm);
   //     for (Integer BEATpm : BEATpmsInPlaylist) {
   //       if (currBEATpm >= BEATpm - 10 && currBEATpm <= BEATpm + 10) {
   //         if (similarities.length() > 0) {
   //           similarities.append(", ");
   //         }
   //         similarities.append("BEATpm: ").append(currSong.BEATpm); // Ensure BEATpm is added here
   //         matchCount++;
   //              int diff;
   //             if(BEATpm<=currBEATpm){
   //              diff = (  currBEATpm - BEATpm);
   //             }
   //             else{
   //               diff = (BEATpm - currBEATpm);
   //             }
   //          currSong.wgt += 30-diff;
   
   //         break; // Stop after the first match
   //       }
   //     }

   //     // Check for matching tags
   //     if (currSong.tags != null) {
   //       for (String tag : currSong.tags) {
   //         if (tagsInPlaylist.contains(tag)) {
   //           if (similarities.length() > 0) {
   //             similarities.append(", ");
   //           }
   //           similarities.append("Tag: ").append(tag);
   //           matchCount++;
   //           currSong.wgt = currSong.wgt+10;
   //         }
   //       }
   //     }

   //     // If there are 2 or more matches, add the song to the suggested list
   //     if (matchCount >= 2&&currSong.wgt>=60) {
   //       currSong.similarities = similarities.toString();
   //       suggestedSongs.add(currSong);
   //     }
   //   }
   //   currSong = currSong.sNext; // Move to the next song
   // }

   // // Step 3: Look for songs in other users' playlists
   // User otherUser = user1; // Start from the first user
   // while (otherUser != null) {
   //   if (!otherUser.UID.equals(UserID)) { // Exclude the current user
   //     Playlist otherPlaylist = otherUser.p; // Get the other user's playlist
   //     Song otherSong = otherPlaylist.First; // Start from the first song in the other user's playlist

   //     while (otherSong != null) {
   //       if (!currPlaylist.Contains(otherSong.ID)) {
   //         StringBuilder similarities = new StringBuilder();
   //         int matchCount = 0;

   //         // Check for matching genre
   //         if (genresInPlaylist.contains(otherSong.GENRE)) {
   //           similarities.append("Genre: ").append(otherSong.GENRE);
   //           matchCount++;
   //           otherSong.wgt = otherSong.wgt+ 40;
   //         }

   //         // Check for matching artist
   //         //if (artistsInPlaylist.contains(otherSong.ARTIST)) {
   //         //    if (similarities.length() > 0) {
   //         //        similarities.append(", ");
   //         //    }
   //         //    similarities.append("Artist: ").append(otherSong.ARTIST);
   //         //    matchCount++;
   //         //}

   //         // Check for matching BEATpm
   //         int otherBEATpm = Integer.parseInt(otherSong.BEATpm);
   //         for (Integer BEATpm : BEATpmsInPlaylist) {
   //           if (otherBEATpm >= BEATpm - 10 && otherBEATpm <= BEATpm + 10) {
   //             if (similarities.length() > 0) {
   //               similarities.append(", ");
   //             }
   //             similarities.append("BEATpm: ").append(otherSong.BEATpm); // Ensure BEATpm is added here
   //             matchCount++;
   //             int diff;
   //             if(BEATpm<=otherBEATpm){
   //              diff = (  otherBEATpm - BEATpm);
   //             }
   //             else{
   //               diff = (BEATpm - otherBEATpm);
   //             }
   //              currSong.wgt += 30-diff;
   //             break; // Stop after the first match
   //           }
   //         }

   //         // Check for matching tags
   //         if (otherSong.tags != null) {
   //           for (String tag : otherSong.tags) {
   //             if (tagsInPlaylist.contains(tag)) {
   //               if (similarities.length() > 0) {
   //                 similarities.append(", ");
   //               }
   //               similarities.append("Tag: ").append(tag);
   //               matchCount++;
   //               otherSong.wgt = otherSong.wgt+10;
   //             }
   //           }
   //         }

   //         // If there are 2 or more matches, add the song to the suggested list
   //         if (matchCount >= 2 && otherSong.wgt >=60) {
   //           otherSong.similarities = similarities.toString();
   //           suggestedSongs.add(otherSong);
   //         }
   //       }
   //       otherSong = otherSong.sNext; // Move to the next song in the other user's playlist
   //     }
   //   }
   //   otherUser = otherUser.uNext; // Move to the next user in the linked list
   // }

   // // Step 4: Print suggestions
   // if (!suggestedSongs.isEmpty()) {
   //   // Convert the Set to an array
   //   int count =0;
   //   Song[] suggestedArray = new Song[suggestedSongs.size()];
   //   int index = 0;
   //   for (Song song : suggestedSongs) {
   //     suggestedArray[index++] = song;
   //   }

   //   // Sort the array by wgt in descending order
   //   for (int i = 0; i < suggestedArray.length - 1; i++) {
   //     for (int j = 0; j < suggestedArray.length - 1 - i; j++) {
   //       if (suggestedArray[j].wgt < suggestedArray[j + 1].wgt) {
   //         // Swap
   //         Song temp = suggestedArray[j];
   //         suggestedArray[j] = suggestedArray[j + 1];
   //         suggestedArray[j + 1] = temp;
   //       }
   //     }
   //   }

      println("Suggested Songs for " + currUser.username + ":");
      for (Song song : suggestedArray) {
        // Print each suggested song with its genre, artist, title, and similarities
        println(
        //song.GENRE +  " by " +
        song.ID + ", " + song.TITLE + " (Similarities: "  + song.similarities + "), " + song.wgt + "%");
      count++;
    }
    } else {
      println("No suggestions available for " + currUser.username + ".");
    }
  }

  void sortSuggestedSongs(List<Song> songs) {
    for (int i = 0; i < songs.size() - 1; i++) {
      for (int j = 0; j < songs.size() - 1 - i; j++) {
        if (songs.get(j).wgt < songs.get(j + 1).wgt) {
          // Swap
          Song temp = songs.get(j);
          songs.set(j, songs.get(j + 1));
          songs.set(j + 1, temp);
        }
      }
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

  void addToLib(Song s, User u)
  {
    u.addLib(s);
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
    library.println(s.ID+", " +s.TITLE+", " +s.ARTIST+", "+s.GENRE+", "+s.BEATpm+", "+s.tags[0]+", "+s.tags[1]+", "+s.tags[2]);
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
    int index = 0;
    String[]userLibSongs=loadStrings(curUserLib);
    String[] initAdds = new String[1000];
    if (userLibSongs!=null)
      for (String line : songStats)
      {

        String[] songStats = line.split(",");
        String adds = songStats[0].trim();
        initAdds[index] = adds;
        index++;
      }
    index = 0;
    for (String p : userLibSongs)
    {
      String[]sAttributes=p.split(",");
      Song temp = new Song(sAttributes[0].trim(), sAttributes[1].trim(), sAttributes[2].trim(), sAttributes[3].trim(), sAttributes[4].trim(), sAttributes[5].trim(), sAttributes[6].trim(), sAttributes[7].trim(), initAdds[index] );
      curUser.addLib(temp);
      system.lib.add(sAttributes[1].trim());
      index++;
    }
  }

void createPlaylist(String name, String PID)
  {
    PrintWriter newPlist=createWriter(dataPath("/Users/"+curUser.username+"/Playlists/"+name+".txt"));
    newPlist.println(PID);
    newPlist.flush();
    newPlist.close();
    curUser.pNames.add(name);
    Playlist p=new Playlist(name, PID);
    curUser.addPlaylist(p);
  }

  void pAddSong(Playlist plist, Song p)
  {
    plist.addSong(p);
    File temp=new File(dataPath("/Users/"+curUser.username+"/Playlists/"+system.curPlaylist.name+".txt"));
    String[]arr=loadStrings(temp);
    PrintWriter addToPlist=createWriter(dataPath("/Users/"+curUser.username+"/Playlists/"+system.curPlaylist.name+".txt"));
    for (String s : arr)
    {
      addToPlist.println(s);
    }
    addToPlist.println(p.ID+", " + p.TITLE+", " + p.ARTIST+", " + p.GENRE+", " + p.BEATpm+", " + p.tags[0]+", " + p.tags[1]+", " + p.tags[2]);
    addToPlist.flush();
    addToPlist.close();
  }

  void removeSongPlist(Song p)
  {
    Playlist playlist=system.curPlaylist;
    playlist.removeIndex(p.TITLE);
    playlist.songs.remove(p.TITLE);
    File playlistFile=new File(dataPath("/Users/"+curUser.username+"/Playlists/"+playlist.name+".txt"));
    String[]playlistFileArr=loadStrings(playlistFile);
    PrintWriter playlistWriter=createWriter(dataPath("/Users/"+curUser.username+"/Playlists/"+playlist.name+".txt"));
    playlistWriter.println(playlistFileArr[0]);
    for (int i=1; i<playlistFileArr.length; i++)
    {
      String[]song=playlistFileArr[i].split(",");
      println(song[0], song[1]);
      if (!song[1].trim().equals(p.TITLE))
      {
        playlistWriter.println(song[0]+", " + song[1]+", " + song[2]+", " + song[3]+", " +song[4]+", " +song[5]+", " + song[6]+", " + song[7]);
      }
    }
    playlistWriter.flush();
    playlistWriter.close();
    playlist.setButton();
  }
  void reset()
  {
    curUser.libraryFirst=null;
  }


  //This code was just hanging out here I'm not sure which method it belongs in
  //User FirstU = new User(name, pw, UID);
  //IndexU = FirstU;
  //PrintWriter uFile;
  //uFile = createWriter("data/Users/" + UID + ".txt");
  //uFile.println(name + ", " + pw + ", " + UID);
  //uFile.flush();
  //uFile.close();
  //else

  {
  }

  void eventGeneration()
  {
    if (eventTimer - millis() <= -5000)
    {
      String requestingUser = str(int(random(5)));
      String songID = str(int(random(1000)));

      simAdds(requestingUser, songID);
      //checkAdds();

      eventTimer = millis();
    }
  }

  void initAdds()
  {
    Song addIndex = ds.First;
    while(addIndex != null)
    {
     if(!"0".equals(addIndex.adds) && addIndex.adds != null )
     {
       addIndex.initAdds = true;
     }
     addIndex = addIndex.next;
    }
    for (File userFolder : uFiles)
    {
      File libraryFile = new File(userFolder, "library.txt");
      if (libraryFile.exists())
      {
        String[] contents = loadStrings(libraryFile);
        for (int i=0; i<contents.length; i++)
        {
          String[] temp = contents[i].split(",");
          String id = temp[0];
          //temp[i].trim();

          Song index = ds.First;
          while (index != null)
          {
            //println(index.initAdds);
            //println(index.ID, id);
            if (index.adds == null)
            {
              index.adds = str(0);
            }
            if (index.ID.equals(id) && index.initAdds == false)
            {
              index.adds = str(int(index.adds) + 1);
              //println(index.adds, index.ID);
            }
            index = index.next;
          }
        }
      }
    }
  }

  void checkAdds()
  {
    PrintWriter stats;
    stats = createWriter("data/songStats.txt");
    Index = ds.First;
    String[] statsList = new String[1000];
    //println(Index);
    while (Index!=null)
    {

      if (Index.adds == null)
      {
        statsList[int(Index.ID) - 1] = "0";
      } else
      {
        statsList[int(Index.ID) - 1] = Index.adds;
      }

      Index = Index.next;
    }
    for(int i=0; i<statsList.length; i++)
    {
      println(statsList[i]);
      stats.println(statsList[i]);
    }
    stats.flush();
    stats.close();
    //songStatIDs = loadStrings("data/songStats.txt");
  }
  void simAdds(String user, String songID)
  {
    User grabbedUser = new User(null, null, null, null, null, null);
    Song grabbedSong = new Song(null, null, null, null, null, null, null, null, null);
    indexUser = FirstU;
    while (indexUser != null)
    {
      if (indexUser.UID.equals(user))
      {
        grabbedUser = indexUser;
        break;
      }
      indexUser = indexUser.uNext;
    }
    Index = ds.First;
    while (Index != null)
    {

      if (Index.ID.equals(songID))
      {
        grabbedSong = Index;
        break;
      }
      Index = Index.next;
    }

    println(grabbedUser.UID, grabbedSong.ID);
    addToLib(grabbedSong, grabbedUser);
  }
}
