// ignore_for_file: missing_return

void main(List<String> args) {
  var calculator = Calculator();
  calculator.Calculate(Operation.PLUS, 120);
  calculator.Calculate(Operation.DIVIDE, 2);
  calculator.Calculate(Operation.MINUS, 10);
  calculator.Calculate(Operation.TIMES, 3);
  calculator.Undo(2);
  calculator.Redo(2);
}

// ---------------------------------------------------------------------------------------------------
enum Operation { PLUS, MINUS, TIMES, DIVIDE }

// ---------------------------------------------------------------------------------------------------
class ICommand {
  void ForwardCalculate() {}
  void BackwardCalculate() {}
}

// ---------------------------------------------------------------------------------------------------
class CalculateCommand implements ICommand {
  Operation operation;
  double operand;
  CalculateProvider calculateProvider;

  CalculateCommand(this.calculateProvider, this.operation, this.operand);

  Operation Undo(Operation operation) {
    switch (operation) {
      case Operation.PLUS:
        return Operation.MINUS;
        break;
      case Operation.MINUS:
        return Operation.PLUS;
        break;
      case Operation.TIMES:
        return Operation.DIVIDE;
        break;
      case Operation.DIVIDE:
        return Operation.TIMES;
        break;
      default:
        break;
    }
  }

  @override
  void BackwardCalculate() {
    calculateProvider.Calculate(Undo(operation), operand);
  }

  @override
  void ForwardCalculate() {
    calculateProvider.Calculate(operation, operand);
  }
}

// ---------------------------------------------------------------------------------------------------
class CalculateProvider {
  double currentValue = 0;
  double lastValue = 0;
  String operationSymbol;
  void Calculate(Operation operation, double operand) {
    switch (operation) {
      case Operation.PLUS:
        currentValue += operand;
        break;
      case Operation.MINUS:
        currentValue -= operand;
        break;
      case Operation.TIMES:
        currentValue *= operand;
        break;
      case Operation.DIVIDE:
        currentValue /= operand;
        break;
    }
    operationSymbol = getOperationSymbol(operation);
    print('$lastValue $operationSymbol $operand = $currentValue');
    lastValue = currentValue;
  }

  String getOperationSymbol(Operation operation) {
    switch (operation) {
      case Operation.PLUS:
        return '+';
        break;
      case Operation.MINUS:
        return '-';
        break;
      case Operation.TIMES:
        return '*';
        break;
      case Operation.DIVIDE:
        return '/';
        break;
      default:
        return '';
    }
  }
}

// ---------------------------------------------------------------------------------------------------
class Calculator {
  CalculateProvider calculateProvider = CalculateProvider();
  List<ICommand> commandList = <ICommand>[];
  double currentState = 0;

  void Redo(int howManyTimes) {
    if (howManyTimes <= commandList.length) {
      print('------------------------- Move forward $howManyTimes times');
      for (var index = 0; index < howManyTimes; index++) {
        if (currentState < commandList.length) {
          var command = commandList[currentState.toInt()];
          command.ForwardCalculate();
        }
        currentState++;
      }
    } else {
      print(
          "------------------------- overflow from total of steps for 'redo' !!");
    }
  }

  void Undo(int howManyTimes) {
    if (howManyTimes <= commandList.length) {
      print('-------------------------  Take it back $howManyTimes times');
      for (var index = 0; index < howManyTimes; index++) {
        if (currentState > 0) {
          var command =
              commandList[currentState.toInt() - 1] as CalculateCommand;
          command.BackwardCalculate();
        }
        currentState--;
      }
    } else {
      print(
          "------------------------- overflow from total of steps for 'undo' !!");
    }
  }

  void Calculate(Operation operation, double operand) {
    var command = CalculateCommand(calculateProvider, operation, operand);
    command.ForwardCalculate();
    commandList.add(command);
    currentState++;
  }
}
