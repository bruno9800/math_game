import 'package:flutter/material.dart';
import 'package:math_game/data/models/player.dart';
import 'package:math_game/data/repositories/firebase_repository_impl.dart';

class PlayerProvider with ChangeNotifier {
  PlayerEntity? player;
  // Adicione outros campos de informações do usuário, se necessário

  void setUserByEmail(String email) async {
    player = await FirebaseRepositoryImpl().getUserByEmail(email);
    notifyListeners();
  }

  List<int> getStars() {
    return player!.stars.values.toList();
  }

  void updateStars(int level, int stars) async {
    await FirebaseRepositoryImpl().updateStars(player!, level, stars);
    notifyListeners();
  }
  String getEmail() {
    return player!.email;
  }
}