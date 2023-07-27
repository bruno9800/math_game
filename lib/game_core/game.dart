import 'dart:math';

import 'package:math_game/game_core/piece.dart';

class Game {
  int difficulty;
  List<Piece> pieces = [];

  Game(this.difficulty) {
    pieces = setPieces(difficulty);
  }

  void restart() {
    pieces = setPieces(difficulty);
  }

  List<Piece> setPieces(difficulty) {
    List<Piece> pieces = [];
    List<int> numbers = _generateNumbers(8);
    Random random = Random();

    while (pieces.length < 24) {
      int actualNumber = random.nextInt(numbers.length);
      //Math.floor(Math.random() * numbers.length);
      Piece piece = Piece(numbers[actualNumber], difficulty);
      int quantityNumber = pieces.fold(0, (acc, element) {
        if (numbers[actualNumber] == element.result) {
          return acc + 1;
        }
        return acc;
      });
      if (quantityNumber < 3) {
        pieces.add(piece);
      }
    }
    return pieces;
  }



  List<int> _generateNumbers(quantity) {

    List<int> numbers = [];
    Random random = Random();
    while (numbers.length < quantity) {
      int randomNumber = random.nextInt(10 * (difficulty/10).ceil() - 1) + 1;
      //Math.floor(Math.random() * ( 10 * difficulty - 1)) + 1;
      if (!numbers.contains(randomNumber)) {
        numbers.add(randomNumber);
      }
    }
    return numbers;
  }

  @override
  String toString() {
    String showPieces = "";
    for (Piece piece in pieces) {
      showPieces += '$piece\n';
    }

    return "{difficulty: $difficulty,\npieces: {$showPieces}}";
  }
}