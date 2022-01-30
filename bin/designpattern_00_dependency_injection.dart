void main(List<String> arguments) {
  var databaseProvider;

  databaseProvider = DatabaseProvider(Firestore());
  databaseProvider.Query();

  databaseProvider = DatabaseProvider(MongoDB());
  databaseProvider.Query();
}

// ---------------------------------------------------------------------------------------------------
  // DEPENDENCY INJECTION

class DatabaseProvider {
  final IDatabase _IDatabase;
  DatabaseProvider(this._IDatabase);
  void Query() => _IDatabase.Query();
}

// ---------------------------------------------------------------------------------------------------

class IDatabase {
  void Query() {
    print('At runtime this process not running...');
  }
}

// ---------------------------------------------------------------------------------------------------

class Firestore implements IDatabase {
  Firestore() {
    print('Firestore running...');
  }

  @override
  void Query() {
    print('Firestore Query() is running...');
  }
}

// can be replicate in this way.
class MongoDB implements IDatabase {
  MongoDB() {
    print('MongoDB running...');
  }
  @override
  void Query() {
    print('MongoDB Query() is running...');
  }
}
