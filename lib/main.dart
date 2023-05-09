import 'package:flutter/material.dart';
import 'package:music_player/Music_Screen/Provider/Music_Provider.dart';
import 'package:music_player/Music_Screen/View/Home_Screen.dart';
import 'package:music_player/Music_Screen/View/play_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations( [DeviceOrientation.portraitUp]);
  runApp(
      Sizer(
          builder: (context, orientation, deviceType) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (context) => MusicProvider(),)
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: '/',
                routes: {
                  '/':(context) => HomeScreen(),
                  'play':(context) => PlayScreen(),
                },
              ),
            );
          }
      )
  );
}
