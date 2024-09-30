int stage=0;
User us = new User();

void setup() {
  //size(800, 600);
  initialize();
  us.playlist();
}

void draw() {
  //userInterface();
}

void userInterface()
{
  if (stage == 0)
  {
    background(#191414);
    rectMode(CENTER);
    fill(#1ed760);
    if (mouseX > 50 && mouseX < 350 && mouseY > 200 && mouseY < 400)
    {
      fill(#4be582);
    }
    Button user = new Button(200, 300, 300, 200);
    user.update();
    fill(#191414);
    textSize(80);
    text("User", 120, 320);
    fill(#1ed760);
    if (mouseX > 450 && mouseX < 750 && mouseY > 200 && mouseY < 400)
    {
      fill(#4be582);
    }
    Button admin = new Button(600, 300, 300, 200);
    admin.update();
    fill(#191414);
    text("Admin", 495, 320);
  } else if (stage == 1)
  {
    background(0);
  } else if (stage == 2)
  {
    background(0);
  }
}
void initialize() {
  String[] SongList = loadStrings("SongsDatabase.txt");

  for (String line : SongList) {
    String[] SongInfo = line.split(",");
    String id = SongInfo[0].trim();
    String title = SongInfo[1].trim();
    String artist = SongInfo[2].trim();
    String genre = SongInfo[3].trim();
    String beatpm = SongInfo[4].trim();
    us.ds.AddSong(id, title, artist, genre, beatpm);
  }
}

void mouseReleased()
{
  if (stage == 0)
  {
    if (mouseX > 50 && mouseX < 350 && mouseY > 200 && mouseY < 400)
    {
      stage = 1;
    } else if (mouseX > 450 && mouseX < 750 && mouseY > 200 && mouseY < 400)
    {
      stage = 2;
    }
  }
}
