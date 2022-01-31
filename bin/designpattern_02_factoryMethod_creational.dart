void main(List<String> args) {
  var mobileScreenFactoryProvider = FactoryProvider(MobileScreenFactory());
  mobileScreenFactoryProvider.Producer();

  var monitorScreenFactoryProvider = FactoryProvider(MonitorScreenFactory());
  monitorScreenFactoryProvider.Producer();
}
// ---------------------------------------------------------------------------------------------------
class FactoryProvider {
  FactoryProvider(this._factory);
  final IFactory _factory;
  
  void Producer() {
    var screen = _factory.CreateScreen();
    screen.Produce();
  }
}
// ---------------------------------------------------------------------------------------------------
class IFactory {
  IScreen CreateScreen() {
    return IScreen();
  }
}

class MobileScreenFactory implements IFactory {
  @override
  IScreen CreateScreen() {
    return MobileScreen();
  }
}

class MonitorScreenFactory implements IFactory {
  @override
  IScreen CreateScreen() {
    return MonitorScreen();
  }
}
// ---------------------------------------------------------------------------------------------------
class IScreen {
  void Produce() {}
}

class MobileScreen implements IScreen {
  @override
  void Produce() {
    print('Mobile Screen Produced. OK');
  }
}

class MonitorScreen implements IScreen {
  @override
  void Produce() {
    print('Monitor Screen Produced. OK');
  }
}
