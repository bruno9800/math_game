import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class AudioProvider extends ChangeNotifier {
  final player = AudioPlayer();
  final successPlayer = AudioPlayer();
  int successVolume = 70;

  Future<void> playMusic() async {
    try {
      await player.setAsset('music.wav');
      await player.setLoopMode(LoopMode.one);
      await player.setVolume(20/100);
      await player.play();
    } catch (e) {
      print('Erro na reprodução da música: $e');
    }

  }

  // Implemente os métodos para pausar, retomar e parar a música, se necessário.

  void changeVolumeMusic(int value) async {
    await player.setVolume(value/100);
  }

  void changeVolumeEffect(int value ) {
    successVolume = value;
  }

  Future<void> playSuccess() async {
    try {
      await successPlayer.setAsset('success.mp3');
      await successPlayer.setVolume(successVolume / 100);
      await successPlayer.play();
    }catch(e) {
      print('Erro na reprodução do toque de sucesso: $e');
    }
  }


  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}