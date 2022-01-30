import 'dart:io';
import 'dart:math';
void main(List<String> args) {
  var spp = CalculatorProxy();
  var processList = ['process1', 'process2'];
  for (var i = 0; i < 10; i++) spp.Calculate(processList[Random().nextInt(2)]);
}

// ---------------------------------------------------------------------------------------------------

abstract class ICalculator {
  String Calculate(String message);
}

class Calculator implements ICalculator {
  @override
  String Calculate(String message) {
    sleep(Duration(seconds: 2)); // LONG PROCESS SIMULATION
    print('$message \tfrom Calculate()');
    return message;
  }
}

// ---------------------------------------------------------------------------------------------------

class CalculatorProxy implements Calculator {
  // or Calculator extends
  Calculator sampleProcess;
  String cache;

  @override
  String Calculate(String message) {
    if (cache == null || cache != message) {
      sampleProcess = Calculator();
      cache = sampleProcess.Calculate(message);
      return message;
    } else {
      print('$cache \tfrom Cached');
      return cache;
    }
  }
}
