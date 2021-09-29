void main(List<String> args) {
  var ss = System();
  ss.active();

  ss.disactive();
}

class System {
  // FACADE STRUCT
  final _powerManagement = PowerMng();
  final _securitySystem = SecuritySystem();
  final _processor = Processor();

  void active() {
    _powerManagement.powerOn();
    _securitySystem.enabled();
    _processor.runner();
  }

  void disactive() {
    _powerManagement.powerOff();
    _securitySystem.disabled();
    _processor.dispose();
  }
}

class PowerMng {
  PowerMng();
  void powerOn() {
    print('Power Management is On');
  }

  void powerOff() {
    print('Power Management is Off');
  }
}

class SecuritySystem {
  SecuritySystem();
  void enabled() {
    print('Security System is Enabled');
  }

  void disabled() {
    print('Security System is Disabled');
  }
}

class Processor {
  Processor();
  void runner() {
    print('Processor is running');
  }

  void dispose() {
    print('Processor is dispose');
  }
}
