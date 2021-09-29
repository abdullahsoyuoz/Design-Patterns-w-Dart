void main(List<String> args) {
  var controllerA = ControllerA();
  var logVisitor = XxLogVisitor();

  logVisitor.Supplement(controllerA);
}

abstract class ControlBase {
  int id;
  void Supplier(IVisitor visitor);
}

class ControllerA extends ControlBase {
  @override
  void Supplier(IVisitor visitor) {
    visitor.Supplement(this);
  }
}

abstract class IVisitor {
  void Supplement(ControlBase controller);
}

class XxLogVisitor extends IVisitor {
  @override
  void Supplement(ControlBase controller) {
    if (controller is ControllerA) {
      print('ControllerA Logged!');
    }
  }
}
