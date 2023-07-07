import 'dart:math';

class Piece {
  int result;
  int difficulty;
  String? expression;

  Piece(this.result, this.difficulty) {
    expression = setExpression(result, difficulty);
  }

  String setExpression(int result, int difficulty) {
    Random random = Random();
    int limitNumber = 10 * difficulty;
    String expression = "";
    while (true) {
      int randomNumber = random.nextInt(limitNumber - 1) + 1;
      // Math.floor(Math.random() * (limitNumber - 1)) + 1;
      if (difficulty == 1) {
        int randomNumber2 = random.nextInt(limitNumber - 1) + 1;
        int randomNumber3 = random.nextInt(limitNumber - 1) + 1;
        if (randomNumber + randomNumber2 == result) {
          expression = "$randomNumber + $randomNumber2";
          // `${randomNumber} + ${randomNumber2}`;
          break;
        }
        if (randomNumber - randomNumber2 == result) {
          expression = "$randomNumber - $randomNumber2";
          break;
        }
        if (randomNumber2 + randomNumber - randomNumber3 == result) {
          expression = "$randomNumber + $randomNumber2 - $randomNumber3";
          break;
        }
        // if (randomNumber == result) {
        //   expression = "$randomNumber";
        //   break;
        // }
      }
    }
    return expression;
  }

  @override
  String toString() {
    return "{ result: $result,\ndifficulty: $difficulty,\nexpression: $expression }";
  }
}
