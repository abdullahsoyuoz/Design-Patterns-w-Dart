void main(List<String> args) {
  var factoryProvider = DatabaseFactoryProvider(MongoDB(), '192.168.1.1', FetchAllData());
  factoryProvider.Process();
}
// ---------------------------------------------------------------------------------------------------
class DatabaseFactoryProvider {
  final IDatabase _factory;
  String connectionUrl;
  IQuery query;

  DatabaseFactoryProvider(this._factory, this.connectionUrl, this.query);

  void Process() {
    _factory.ConnectViaConnector().Connect(connectionUrl);
    // THEN
    _factory.ExecuteQuery().Execute(query);
  }
}
// ---------------------------------------------------------------------------------------------------
  // Could be Singleton
class IDatabase {
  IConnector ConnectViaConnector() {
    return IConnector();
  }
  IQuery ExecuteQuery() {
    return IQuery();
  }
}

class MongoDB implements IDatabase {
  @override
  IQuery ExecuteQuery() {
    return FetchAllData();
  }

  @override
  IConnector ConnectViaConnector() {
    return MongoConnector();
  }
}
// ---------------------------------------------------------------------------------------------------
  // Operations

class IConnector {
  void Connect(String connectionUrl) {}
}

class MongoConnector implements IConnector {
  @override
  void Connect(String connectionUrl) {
    print('connected to $connectionUrl via MongoConnector');
  }
}

class IQuery {
  void Execute(IQuery query) {}
}

class FetchAllData implements IQuery {
  @override
  void Execute(IQuery query) {
    print('${query.toString()} : query was executed from FetchAllData method');
  }

  @override
  String toString() {
    return "Select * from _table";
  }
}

