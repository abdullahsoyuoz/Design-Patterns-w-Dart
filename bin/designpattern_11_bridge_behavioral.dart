void main(List<String> args) {
  final speakerController = RemoteController(device: Speaker());
  speakerController.turnOn();

  final monitorController = RemoteController(device: Monitor());
  monitorController.turnOn();
}

abstract class ControllerBase {
  DeviceBase device;
  void turnOn() {
    device.run();
  }
}

class RemoteController extends ControllerBase {
  @override
  DeviceBase device;
  RemoteController({this.device});

  @override
  void turnOn() {
    device.run();
  }
}

abstract class DeviceBase {
  void run();
}

class Speaker extends DeviceBase {
  @override
  void run() {
    print('Speaker running...');
  }
}

class Monitor extends DeviceBase {
  @override
  void run() {
    print('Monitor running...');
  }
}
