void main(List<String> args) {
  HandleBase handleController;

  handleController = ConditionA();
  handleController.Calculate();

  handleController = ConditionB();
  handleController.Calculate();
}

abstract class HandleBase {
  void Calculate();
}

class ConditionA implements HandleBase {
  @override
  void Calculate() {
    print('ConditionA calculate');
  }
}

class ConditionB implements HandleBase {
  @override
  void Calculate() {
    print('ConditionB calculate');
  }
}
