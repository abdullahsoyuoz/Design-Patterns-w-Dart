void main(List<String> args) {
  var sampleLowerCasePrinter = Printer(strategy: LowerCaseStrategy());
  print('Lower Case Strategy Sample: ' + sampleLowerCasePrinter.print('Sample Message Text'));

  var sampleUpperCasePrinter = Printer(strategy: UpperCaseStrategy());
  print('Upper Case Strategy Sample: ' + sampleUpperCasePrinter.print('Sample Message Text'));
}
// ---------------------------------------------------------------------------------------------------
class Printer {
  final PrintStrategy _strategy;
  Printer({PrintStrategy strategy}) : _strategy = strategy;

  String print(String message) => _strategy.print(message);
}
// ---------------------------------------------------------------------------------------------------
abstract class PrintStrategy {
  String print(String message);
}

class UpperCaseStrategy extends PrintStrategy {
  @override
  String print(String message) {
    return message.toUpperCase();
  }
}

class LowerCaseStrategy extends PrintStrategy {
  @override
  String print(String message) {
    return message.toLowerCase();
  }
}
