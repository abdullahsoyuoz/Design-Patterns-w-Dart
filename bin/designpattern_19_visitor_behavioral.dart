void main(List<String> args) {
  var controllerA = ControllerA();
  var logVisitor = LogVisitor();

  logVisitor.Supplement(controllerA);
}
// ---------------------------------------------------------------------------------------------------
abstract class ControlBase {
  int id;
  void Supplier(IVisitor visitor);
}

class ControllerA extends ControlBase {
  @override
  void Supplier(IVisitor visitor) {
    visitor.Supplement(this);
  }

  void doAction() {
    print("ControllerA action!");
  }
}
// ---------------------------------------------------------------------------------------------------
abstract class IVisitor {
  void Supplement(ControlBase controller);
}

class LogVisitor extends IVisitor {
  @override
  void Supplement(ControlBase controller) {
    if (controller is ControllerA) {
      controller.doAction();
      print('ControllerA Logged!');
    }
  }
}
