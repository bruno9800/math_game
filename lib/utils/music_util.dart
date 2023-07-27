import 'package:audioplayers/audioplayers.dart';

class AudioUtils {
  static List<AudioPlayer> createAudioPlayers(int count) {
    return List.generate(
      count,
      (_) => AudioPlayer()..setReleaseMode(ReleaseMode.stop),
    );
  }

  static void releasePlayers(List<AudioPlayer> players) {
    for (var player in players) {
      player.release();
    }
  }
}
