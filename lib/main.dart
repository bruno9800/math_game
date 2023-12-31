// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:math_game/firebase_options.dart';
import 'package:math_game/services/provider/audio_provider.dart';
import 'package:math_game/services/provider/player_provider.dart';
import 'package:math_game/services/stream_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //final player = AudioPlayer();
 // await player.play(UrlSource("assets/music.wav"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlayerProvider()),
        ChangeNotifierProvider(create: (_) => AudioProvider()),
      ],
      child: MaterialApp(
        //darkTheme: CustomTheme.darkMode,
        debugShowCheckedModeBanner: false,
        home: StreamWidget(),
        theme: ThemeData(),
        //themeMode: ThemeMode.system,
        title: 'Matthie',
      ),
    );
  }
}
