import 'dart:math';

class Piece {
  late int result;
  late int difficult;
  late String expression;
  bool isVisible = true;

  Piece(this.result, this.difficult) {
    expression = setExpression();
  }

  setIsVisible(bool isVisible) {
    this.isVisible = isVisible;
  }

  String setExpression() {
    if (difficult == 1) {
      return _getExpressionWithN(result, 2);
    } else {
      return _getExpressionWithN(result, 2);
    }
  }

  String _getExpressionWithN(int number, int factors) {
    final type = Random().nextDouble();
    if (factors == 1) {
      return '$number';
    } else if (factors == 2) {
      if (type < 0.33 || number == 1) {
        return _getExpressionAddWith2Factor(number);
      } else if (type < 0.66) {
        return _getExpressionMultiplicationWithN(number, 2);
      } else {
        return _getExpressionDivisionWith2Factor(number);
      }
    } else {
      if (type < 0.33 || number == 1) {
        final termos = _getAddWith2Factor(number);
        final otherExp = _getExpressionWithN(termos[1], factors - 1);

        if (otherExp[0] == '-')
          return '${termos[0]}' + otherExp;
        else
          return '${termos[0]}+' + otherExp;
      } else if (type < 0.66) {
        final termos = _getMultiplicationWithN(number, 2);
        final otherExp = _getExpressionWithN(termos[1], factors - 1);

        return '${termos[0]}*($otherExp)';
      } else {
        return _getExpressionDivisionWith2Factor(number);
      }
    }
  }

  String _getExpressionAddWith2Factor(int number) {
    var delta = (Random().nextInt(difficult * 20 + 1) *
        ((Random().nextDouble() - 0.5) > 0 ? 1 : -1))
        .floor();
    if (delta == number) delta += 1;
    if (number < delta)
      return '$delta-${-number + delta}';
    else
      return '$delta+${number - delta}';
  }

  List<int> _getAddWith2Factor(int number) {
    var delta = (Random().nextInt(difficult * 10 + 1) *
        ((Random().nextDouble() - 0.5) > 0 ? 1 : -1))
        .floor();
    if (delta == number) delta += 1;
    return [delta, number - delta];
  }

  List<int> _getDivisionWith2Factors(int number) {
    final valor = (Random().nextInt(difficult * 3 + 1) + 1);
    return [valor * number, valor];
  }

  String _getExpressionDivisionWith2Factor(int number) {
    final factors = _getDivisionWith2Factors(number);
    return '${factors[0]}/${factors[1]}';
  }

  String _getExpressionMultiplicationWithN(int number, int numberFactors) {
    String exp = '';
    int n = number;

    numberFactors -= 1;
    while (numberFactors > 0) {
      final divisor = _getOneDivisor(n, except_1: false);
      exp += '$divisor*';
      n = (n / divisor).floor();
      numberFactors -= 1;
    }
    exp += '$n';

    return exp;
  }

  String _getExpressionMultiplicationWithMaxN(int number, int numberFactors) {
    final nums = [];
    int n = number;

    numberFactors -= 1;
    while (numberFactors > 0 && !_isPrime(n)) {
      final divisor = _getOneDivisor(n);
      nums.add(divisor);
      n = (n / divisor).floor();
      numberFactors -= 1;
    }
    nums.add(n);

    return nums.join('*');
  }

  List<int> _getMultiplicationWithN(int number, int numberFactors) {
    List<int> nums = [];
    int n = number;

    numberFactors -= 1;
    while (numberFactors > 0) {
      final divisor = _getOneDivisor(n, except_1: false);
      nums.add(divisor);
      n = (n / divisor).floor();
      numberFactors -= 1;
    }
    nums.add(n);

    return nums;
  }

  List<int> _getMultiplicationWithMaxN(int number, int numberFactors) {
    List<int> nums = [];
    int n = number;

    numberFactors -= 1;
    while (numberFactors > 0 && !_isPrime(n)) {
      final divisor = _getOneDivisor(n);
      nums.add(divisor);
      n = (n / divisor).floor();
      numberFactors -= 1;
    }
    nums.add(n);

    return nums;
  }

  bool _isPrime(int number) {
    for (int i = 2; i * i <= number; ++i) {
      if ((number % 2) == 0) return false;
    }
    return true;
  }

  int _getOneDivisor(int number, {bool except_1 = true}) {
    final divisors = except_1 ? [] : [1];
    for (int i = 2; i * i <= number; ++i) {
      if ((number % i) == 0) {
        if (number / i != i) divisors.add(number ~/ i);
        divisors.add(i);
      }
    }
    return divisors[Random().nextInt(divisors.length)];
  }

  @override
  String toString() {
    return "{ expression $expression = $result }\n";
  }
}

