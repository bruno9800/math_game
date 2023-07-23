import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/timer_control.dart';

class StarsProvider with ChangeNotifier {
  int _stars = 1;
  TimerController _timerControl = TimerController();
  late Timer _timerUpdate;
  int _elapsedSeconds = 0;

  StarsProvider() {
    _timerControl.start();
    _timerUpdate = Timer.periodic(Duration(seconds: 1), (_) {
      _elapsedSeconds = _timerControl.getElapsedTime().inSeconds;
      _updateStars();
      notifyListeners();
    });

  }

  int get stars => _stars;
  int get elapsedSeconds => _elapsedSeconds;
  bool get isRunning => _timerControl.isRunning();

  void pause () => _timerControl.pause();
  void unpause() => _timerControl.start();


  void _updateStars() {
    const int rapido = 20; // Replace with the desired time for 3 stars
    const int medio = 40; // Replace with the desired time for 2 stars

    if (_elapsedSeconds <= rapido) {
      _setStars(3);
    } else if (_elapsedSeconds <= medio) {
      _setStars(2);
    } else {
      _setStars(1);
    }
  }

  void _setStars(int stars) {
    if (_stars != stars) {
      _stars = stars;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _timerUpdate.cancel();
    _timerControl.stop();
    super.dispose();
  }
}
