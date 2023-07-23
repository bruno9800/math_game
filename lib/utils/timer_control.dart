import 'dart:async';

class TimerController {
  Timer? _timer;
  Duration _elapsedTime = Duration.zero;
  bool _isRunning = false;

  // Método para iniciar o contador de tempo
  void start() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (_) {
        _elapsedTime += Duration(seconds: 1);
      });
    }
  }

  // Método para pausar o contador de tempo
  void pause() {
    if (_isRunning) {
      _timer?.cancel();
      _isRunning = false;
    }
  }

  // Método para parar o contador de tempo e reiniciar
  void stop() {
    _timer?.cancel();
    _isRunning = false;
    _elapsedTime = Duration.zero;
  }

  // Método para obter o tempo decorrido (considerando pausas)
  Duration getElapsedTime() {
    return _elapsedTime;
  }

  bool isRunning() {
    return _isRunning;
  }
}

