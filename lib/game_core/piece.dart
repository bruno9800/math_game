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
    switch(difficult) {
      case 1: return _getExpressionWithN(result, 2, ['add'], rangeAdd: 10).$1;
      case 2: return _getExpressionWithN(result, 2, ['add'], rangeAdd: 15).$1;
      case 3: return _getExpressionWithN(result, 2, ['add', 'mult']).$1;
      case 4: return _getExpressionWithN(result, 2, ['add', 'mult'], rangeAdd: 15).$1;
      case 5: return _getExpressionWithN(result, 2, ['add', 'mult'], rangeAdd: 20).$1;
      case 6: return _getExpressionWithN(result, 2, ['add', 'mult'], rangeAdd: 25).$1;
      case 7: return _getExpressionWithN(result, 2, ['add', 'mult', 'div']).$1;
      case 8: return _getExpressionWithN(result, 2, ['add', 'mult', 'div'], rangeAdd: 15).$1;
      case 9: return _getExpressionWithN(result, 2, ['add', 'mult', 'div'], rangeAdd: 20).$1;
      case 10: return _getExpressionWithN(result, 2, ['add', 'mult', 'div'], rangeAdd: 25).$1;
      case 11: return _getExpressionWithN(result, 3, ['add'], rangeAdd: 10).$1;
      case 12: return _getExpressionWithN(result, 3, ['add'], rangeAdd: 15).$1;
      case 13: return _getExpressionWithN(result, 3, ['add', 'mult']).$1;
      case 14: return _getExpressionWithN(result, 3, ['add', 'mult'], rangeAdd: 15).$1;
      case 15: return _getExpressionWithN(result, 3, ['add', 'mult'], rangeAdd: 20).$1;
      case 16: return _getExpressionWithN(result, 3, ['add', 'mult'], rangeAdd: 25).$1;
      case 17: return _getExpressionWithN(result, 3, ['add', 'mult', 'div']).$1;
      case 18: return _getExpressionWithN(result, 3, ['add', 'mult', 'div'], rangeAdd: 15).$1;
      case 19: return _getExpressionWithN(result, 3, ['add', 'mult', 'div'], rangeAdd: 20).$1;
      case 20: return _getExpressionWithN(result, 3, ['add', 'mult', 'div'], rangeAdd: 25).$1;
      default: return _getExpressionWithN(result, 3, ['add', 'mult', 'div'], rangeAdd: 50).$1;
    }
  }

  String getOperation(int number, List<String> operations) {
    String operation;
    if(operations.contains('div') && operations.length > 1 && number > ((difficult ~/ 10)*10 + 10) ){
      List<String> list = operations.where((i) => i != 'div').toList();
      return list[Random().nextInt(list.length)];
    }
    return operations[Random().nextInt(operations.length)];
  }

  // Main Expression Function
  (String, String) _getExpressionWithN(int number, int factors, List<String> operations, {int rangeAdd = 10}) {
    if (factors == 1 || operations.length == 0) {
      return ('$number', '');
    }

    String operation = getOperation(number, operations);

    if(_isPrime(number) && operation == 'mult') {
      operation = getOperation(number, operations);
      if(operation == 'div') operation = getOperation(number, operations);
      if(operation == 'div') operation = getOperation(number, operations);
    }

    if (operation == 'add') {

      if(factors == 2) return (_getExpressionAddWith2Factor(number, rangeAdd), 'add');

      final termos = _getAddWith2Factor(number, rangeAdd);
      final (otherExp, expType) = _getExpressionWithN(termos[1], factors - 1, operations, rangeAdd: rangeAdd);

      if (otherExp[0] == '-')  return ('${termos[0]}' + otherExp, 'add');
      else return ('${termos[0]}+' + otherExp, 'add');

    } else if (operation == 'mult') {

      if(factors == 2) return (_getExpressionMultiplicationWithMaxN(number, 2), 'mult');

      final termos = _getMultiplicationWithMaxN(number, 2);

      if(termos.length == 1) return ('${termos[0]}', '');
      final (otherExp, expType) = _getExpressionWithN(termos[1], factors - 1, operations, rangeAdd: rangeAdd);

      if(expType == 'add') return ('${termos[0]}*($otherExp)', 'mult');
      else return ('${termos[0]}*$otherExp', 'mult');

    } else if (operation == 'div') {
      return (_getExpressionDivisionWith2Factor(number), 'div');
    } else return ('$number', '');
  }


  // Addition
  String _getExpressionAddWith2Factor(int number, int rangeAdd) {
    final [termo1, termo2] = _getAddWith2Factor(number, rangeAdd);
    if (termo2 < 0) return '$termo1-${-termo2}';
    else return '$termo1+$termo2';
  }

  List<int> _getAddWith2Factor(int number, int rangeAdd) {
    var delta = (Random().nextInt(difficult * rangeAdd + 1) *
        ((Random().nextDouble() - 0.5) > 0 ? 1 : -1))
        .floor();
    if (delta == number) delta += 1;
    return [delta, number - delta];
  }


  // Multiplication
  String _getExpressionMultiplicationWithMaxN(int number, int numberFactors) {
    final nums = _getMultiplicationWithMaxN(number, numberFactors);
    return nums.join('*');
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


  // Division
  List<int> _getDivisionWith2Factors(int number) {
    final valor = (Random().nextInt(difficult * 1 + 1) + 1);
    return [valor * number, valor];
  }

  String _getExpressionDivisionWith2Factor(int number) {
    final factors = _getDivisionWith2Factors(number);
    return '${factors[0]}/${factors[1]}';
  }


  // Utilities
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

void main() {
  Piece piece = new Piece(5, 1);
  print(piece.expression);
}
