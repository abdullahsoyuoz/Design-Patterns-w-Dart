void main(List<String> args) {
  var factoryProvider =
      FactoryProvider(XxFactory(), 'www.xx.com', 'select * from');
  factoryProvider.Process();
}

class FactoryProvider {
  final IFactory _factory;
  String connectionUrl;
  String query;

  FactoryProvider(this._factory, this.connectionUrl, this.query);

  void Process() {
    _factory.ConnectViaConnector().Connect(connectionUrl);
    _factory.ExecuteCommand().Execute(query);
  }
}

class IFactory {
  ICommand ExecuteCommand() {
    return ICommand();
  }

  IConnector ConnectViaConnector() {
    return IConnector();
  }
}

class XxFactory implements IFactory {
  @override
  IConnector ConnectViaConnector() {
    return XxConnector();
  }

  @override
  ICommand ExecuteCommand() {
    return XxCommand();
  }
}

class XyFactory implements IFactory {
  @override
  IConnector ConnectViaConnector() {
    return XyConnector();
  }

  @override
  ICommand ExecuteCommand() {
    return XyCommand();
  }
}

class ICommand {
  void Execute(String query) {}
}

class XxCommand implements ICommand {
  @override
  void Execute(String query) {
    print('the $query query was executed by XxCommand');
  }
}

class XyCommand implements ICommand {
  @override
  void Execute(String query) {
    print('the $query query was executed by XyCommand');
  }
}

class IConnector {
  void Connect(String connectionUrl) {}
}

class XxConnector implements IConnector {
  @override
  void Connect(String connectionUrl) {
    print('connected to $connectionUrl via XxDatabaseConnector');
  }
}

class XyConnector implements IConnector {
  @override
  void Connect(String connectionUrl) {
    print('connected to $connectionUrl via XyDatabaseConnector');
  }
}
