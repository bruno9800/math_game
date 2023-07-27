
  // ignore_for_file: prefer_const_constructors
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:math_game/firebase_options.dart';
import 'package:math_game/services/provider/player_provider.dart';
import 'package:math_game/services/stream_widget.dart';
import 'package:provider/provider.dart';

import 'utils/music_util.dart'; // Import the audio_utils.dart file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlayerProvider(),
      child: MaterialApp(
        //darkTheme: CustomTheme.darkMode,
        debugShowCheckedModeBanner: false,
        home: const BackgroundSoundWidget(
          child: StreamWidget(),
        ),
        theme: ThemeData(),
        //themeMode: ThemeMode.system,
        title: 'Matthie',
      ),
    );
  }
}

class BackgroundSoundWidget extends StatefulWidget {
  final Widget child;

  const BackgroundSoundWidget({Key? key, required this.child})
      : super(key: key);

  @override
  _BackgroundSoundWidgetState createState() => _BackgroundSoundWidgetState();
}

class _BackgroundSoundWidgetState extends State<BackgroundSoundWidget> {
  static const defaultPlayerCount = 4;

  late List<AudioPlayer> audioPlayers;
  late List<AudioCache> audioCaches;

  final List<String> availableSounds = [
    'BackgroundSong.wav', // Add the audio file here
    // Add more sound filenames here
  ];

  @override
  void initState() {
    super.initState();
    audioPlayers = AudioUtils.createAudioPlayers(defaultPlayerCount);
    // Add any background audio setup, if required
    // For example, you can load and play a background sound here.
    final backgroundPlayer =
        audioPlayers[0]; // Use the first player for background sound
    const backgroundSong =
        'BackgroundSong.wav'; // Replace this with the correct asset path

    AudioUtils.releasePlayers(backgroundSong as List<AudioPlayer>);
  }

  @override
  void dispose() {
    AudioUtils.releasePlayers(audioPlayers);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
    );
  }
}
