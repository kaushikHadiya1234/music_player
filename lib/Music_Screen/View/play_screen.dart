import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Music_Screen/Provider/Music_Provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  MusicProvider? pt;
  MusicProvider? pf;

  @override
  void initState() {
    Provider.of<MusicProvider>(context,listen: false).intiAudio();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    pf = Provider.of<MusicProvider>(context, listen: false);
    pt = Provider.of<MusicProvider>(context, listen: true);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF3C0444),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,size: 30,),
                 Icon(Icons.more_vert,color: Colors.white,)
                ],
              ),
            ),
             Image.asset("assets/images/mlogo.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${pt!.NameList[pt!.click].name}",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                  IconButton(
                      onPressed: () {
                        pf!.addfavorite(index);
                      }, icon:Icon( pt!.NameList[index].fav!? Icons.favorite:Icons.favorite_border,color:  pt!.NameList[index].fav!?Colors.red:Colors.white38,size: 27,))
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
           PlayerBuilder.currentPosition(
             player: pt!.assetsAudioPlayer,
             builder: (context, position) {
               return  Column(
                 children: [
                   Slider(
                     activeColor: Colors.white,
                     inactiveColor: Colors.grey,
                     max: pt!.time.inSeconds.toDouble(),
                     value: position.inSeconds.toDouble(),
                     onChanged: (value) {
                       position = Duration(seconds: value.toInt());
                       pt!.assetsAudioPlayer.seek(position);
                   },),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 25.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("$position",style: TextStyle(color: Colors.white60),),
                         Text("${pf!.time}",style: TextStyle(color: Colors.white60),),
                       ],
                     ),
                   ),
                 ],
               );
             },
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.refresh,color: Colors.white,size: 27)),
                  IconButton(onPressed: () {
                    pf!.preMusic();
                  }, icon: Icon(Icons.skip_previous,color: Colors.white,size: 27)),
                  FloatingActionButton(onPressed: () {
                    if(pt!.isplay==false)
                      {
                        pf!.PauseMusic();
                      }
                    else
                      {
                        pf!.PlayMusic();
                      }
                  },child: Icon(pt!.isplay==false?Icons.play_arrow:Icons.pause,color: Colors.white,size: 30,),backgroundColor: Colors.purple[800],),
                  IconButton(onPressed: () {
                    pf!.NextMusic();
                  }, icon: Icon(Icons.skip_next,color: Colors.white,size: 27)),
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.queue_music,color: Colors.white,size: 27)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
