import 'package:flutter/material.dart';
import 'package:math_game/data/models/player.dart';
import 'package:math_game/data/repositories/firebase_repository_impl.dart';

class StarsProvider with ChangeNotifier {
  int? stars;

  void setStars(int stars){
    this.stars = stars;
    notifyListeners();
  }

  int getStars() {
    final stars = this.stars ?? 1;
    return stars;
  }

}