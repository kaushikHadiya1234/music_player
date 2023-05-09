import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Music_Screen/Model/Music_model.dart';

class MusicProvider extends ChangeNotifier
{
  List<MusicModel> topList = [
    MusicModel(name: "Daily mix",icon: Icons.calendar_month,c1: Color(
        0xC4496AB6)),
    MusicModel(name: "Favorites",icon: Icons.favorite,c1: Color(0xC46C20AB)),
    MusicModel(name: "Playlists",icon: Icons.queue_music_rounded,c1: Color(
        0xC410704C)),
    MusicModel(name: "Recent",icon: Icons.access_time,c1: Color(0xC4CB531E)),
  ];

  int click=0;

  List<Audio> MusicList = [
    Audio("assets/audio/m1.mp3"),
    Audio("assets/audio/m2.mp3"),
    Audio("assets/audio/m3.mp3"),
    Audio("assets/audio/m4.mp3"),
    Audio("assets/audio/m5.mp3"),
    Audio("assets/audio/m6.mp3"),
    Audio("assets/audio/m7.mp3"),
    Audio("assets/audio/m8.mp3"),
    Audio("assets/audio/m9.mp3"),
    Audio("assets/audio/m10.mp3"),
  ];

  List<MusicModel> NameList=[
    MusicModel(name: "Music 1",fav: false),
    MusicModel(name: "Music 2",fav: false),
    MusicModel(name: "Music 3",fav: false),
    MusicModel(name: "Music 4",fav: false),
    MusicModel(name: "Music 5",fav: false),
    MusicModel(name: "Music 6",fav: false),
    MusicModel(name: "Music 7",fav: false),
    MusicModel(name: "Music 8",fav: false),
    MusicModel(name: "Music 9",fav: false),
    MusicModel(name: "Music 10",fav: false),
  ];

  List<MusicModel> FMusicList = [];

  final assetsAudioPlayer = AssetsAudioPlayer();
  void intiAudio()
  {
    assetsAudioPlayer.open(
       Playlist(audios: MusicList,startIndex: click),
        autoStart: false,
        showNotification: true);
      duration();
  }

  bool isplay = false;
  void PlayMusic()
  {
    isplay = false;
    assetsAudioPlayer.pause();
    notifyListeners();
  }

  void PauseMusic()
  {
    isplay = true;
    assetsAudioPlayer.play();
    notifyListeners();

  }
  Duration time = Duration(seconds: 0);
  void duration()
  {
    assetsAudioPlayer.current.listen((event) {
      time = event!.audio.duration;
      notifyListeners();
    });
  }

  void NextMusic()
  {
    assetsAudioPlayer.next();
    if(click<9)
      {
        click++;
      }
    notifyListeners();
  }

  void preMusic()
  {
    assetsAudioPlayer.next();
    if(click>0)
      {
        click--;
      }
    notifyListeners();
  }

  bool like=false;
  void addfavorite(int index)
  {
    if(NameList[index].fav==false)
    {
      NameList[index].fav=true;
      // FMusicList.add(NameList[index]);
    }
    else
    {
      NameList[index].fav=false;
      // FMusicList.removeAt(index);
    }
    notifyListeners();
  }
}