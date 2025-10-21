import 'dart:io';

void main() {
  final input = FetchUserInput();
  final numbers = input.fetchUserInput();
  final calculator = AddOperation();
  final result = calculator.execute(numbers);
  final resultPrinter = Result();
  resultPrinter.printResult(result);
}

class FetchUserInput {
  List<double> fetchUserInput() {
    print('Enter first number:');
    final number1 = double.parse(stdin.readLineSync()!);
    print('Enter second number:');
    final number2 = double.parse(stdin.readLineSync()!);
    return [number1, number2];
  }
}

abstract class Operation {
  double execute(List<double> numbers);
}

class AddOperation implements Operation {
  @override
  double execute(List<double> numbers) {
    return numbers[0] + numbers[1];
  }
}

class Result {
  void printResult(double result) {
    print('Result: $result');
  }
}
