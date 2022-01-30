void main(List<String> args) {
  var sampleA = DatabaseConnection();
  // other process's
  var sampleB = DatabaseConnection();
  print('database connection\'s identical? : ${sampleA == sampleB}');
}

class DatabaseConnection {
  static final DatabaseConnection _connectionObject =
      DatabaseConnection._internal();
  DatabaseConnection._internal();
  factory DatabaseConnection() => _connectionObject;

  // identical method compare at HashCode level.
  @override
  bool operator ==(Object object) {
    return identical(this, object);
  }
}
