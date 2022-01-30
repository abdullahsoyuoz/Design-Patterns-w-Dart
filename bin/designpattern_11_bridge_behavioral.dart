// ignore_for_file: unused_local_variable
void main(List<String> args) {
  final speakerController = RemoteController(action: Speaker())..turnOn();
  final monitorController = RemoteController(action: Monitor())..turnOn();
}

// ---------------------------------------------------------------------------------------------------

abstract class IController {
  IAction action;
  void turnOn() => action.doAction();
}

class RemoteController extends IController {
  @override
  IAction action;
  RemoteController({this.action});

  @override
  void turnOn() => action.doAction();
}

// ---------------------------------------------------------------------------------------------------

abstract class IAction {
  void doAction();
}

class Speaker extends IAction {
  @override
  void doAction() => print('Speaker running...');
}

class Monitor extends IAction {
  @override
  void doAction() => print('Monitor running...');
}
