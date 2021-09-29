void main(List<String> args) {
  var mobileScreen = FactoryProvider(MobileScreenFactory());
  var webScreen = FactoryProvider(WebScreenFactory());
  mobileScreen.Drawer();
  webScreen.Drawer();
}

class FactoryProvider {
  final IFactory _factory;
  FactoryProvider(this._factory);
  void Drawer() {
    var screen = _factory.CreateScreen();
    screen.Draw();
  }
}

class IScreen {
  void Draw() {}
}

class MobileScreen implements IScreen {
  @override
  void Draw() {
    print('Mobile Screen Drawn');
  }
}

class WebScreen implements IScreen {
  @override
  void Draw() {
    print('Web Screen Drawn');
  }
}

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

class WebScreenFactory implements IFactory {
  @override
  IScreen CreateScreen() {
    return WebScreen();
  }
}
