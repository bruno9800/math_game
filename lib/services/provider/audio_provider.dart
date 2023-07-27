import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class AudioProvider extends ChangeNotifier {
  final player = AudioPlayer();
  final successPlayer = AudioPlayer();

  Future<void> playMusic() async {
    try {
      await player.setAsset('music.wav');
      await player.setLoopMode(LoopMode.one);
      await player.setVolume(20/100);
      await player.play();
    } catch (e) {
      print('Erro na reprodução da música: $e');
    }

    try {
      await successPlayer.setAsset('success.wav');
      successPlayer.setVolume(70/100);
    }catch(e) {
      print('Erro na reprodução do toque de sucesso: $e');
    }
  }

  // Implemente os métodos para pausar, retomar e parar a música, se necessário.

  void changeVolumeMusic(int value) async {
    await player.setVolume(value/100);
  }

  void changeVolumeEffect(int value ) async {
    await successPlayer.setVolume(value / 100);
  }

  void playSuccess() async {
    if (successPlayer.playerState.playing) {
      await successPlayer.seek(Duration.zero);
    } else {
      await successPlayer.play();
    }
  }


  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}