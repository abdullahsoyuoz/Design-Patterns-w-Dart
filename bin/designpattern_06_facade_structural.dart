void main(List<String> args) {
  var ss = System();
  ss.active();
  print("\n");
  ss.disactive();
}

// ---------------------------------------------------------------------------------------------------
  // FACADE STRUCT

class System {
  final _powerManagement = PowerManagement();
  final _processor = Processor();

  void active() {
    _powerManagement.powerOn();
    _processor.runner();
  }

  void disactive() {
    _powerManagement.powerOff();
    _processor.dispose();
  }
}

// ---------------------------------------------------------------------------------------------------

class PowerManagement {
  PowerManagement();
  void powerOn() {
    print('Power Management is On');
  }

  void powerOff() {
    print('Power Management is Off');
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
