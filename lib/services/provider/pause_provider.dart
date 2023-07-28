import 'package:flutter/foundation.dart';

class GamePauseProvider with ChangeNotifier {
  bool _isPaused = false;

  bool get isPaused => _isPaused;

  void setPaused(bool value) {
    _isPaused = value;
    notifyListeners();
  }

  void unpause() {
    _isPaused = false;
    notifyListeners();
  }

}
