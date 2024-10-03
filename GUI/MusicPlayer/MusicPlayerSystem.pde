class MusicPlayerSystem
{
  Song First;
  Song Index;

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

  void AddSongPlaylist(String sAttribute) {
    Song Index;
    Song sTemp = new Song(database.SearchSong(sAttribute).ID,
      database.SearchSong(sAttribute).TITLE,
      database.SearchSong(sAttribute).ARTIST,
      database.SearchSong(sAttribute).GENRE,
      database.SearchSong(sAttribute).BEATpm,
      database.SearchSong(sAttribute).tag1,
      database.SearchSong(sAttribute).tag2,
      database.SearchSong(sAttribute).tag3);
    if (First==null) {
      First = sTemp;
    } else {
      Index = First;
      while (Index.sNext!=null) {
        Index=Index.sNext;
      }
      Index.sNext=sTemp;
    }
  }

  void removeSong(String sAttribute) {
    if (First == null) {
      return;
    }
    Song sToRemove = new Song(database.SearchSong(sAttribute).ID,
      database.SearchSong(sAttribute).TITLE,
      database.SearchSong(sAttribute).ARTIST,
      database.SearchSong(sAttribute).GENRE,
      database.SearchSong(sAttribute).BEATpm,
      database.SearchSong(sAttribute).tag1,
      database.SearchSong(sAttribute).tag2,
      database.SearchSong(sAttribute).tag3);
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

  Song SearchSong(String Att) {
    Index = First;
    while (Index!=null) {
      if (Index.ID.equals(Att)) {
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
