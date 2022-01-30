void main(List<String> args) {
  var modelA = SampleModel('SampleA');
  print(modelA);

  var taker = Taker();
  taker.setBackup = modelA.Recover();

  modelA._name = 'SampleB';
  print(modelA);

  modelA.Restore(taker._backup);
  print(modelA);
}

class SampleModel {
  String _name;
  SampleModel(String name) {
    _name = name;
  }
  void Restore(Backup backup) {
    _name = backup.getName;
  }

  Backup Recover() => Backup(_name);
  @override
  String toString() => 'Güncel isim: $_name | hashCode: ${this.hashCode}';
}

class Backup {
  String _name;
  DateTime _lastEdit;
  String get getName => _name;
  DateTime get getEditTime => _lastEdit;
  set setName(String name) => _name = name;
  set setDate(DateTime time) => _lastEdit = DateTime.now();

  Backup(String name) {
    setName = name;
    setDate = DateTime.now();
  }
}

class Taker {
  Backup _backup;
  Backup get getBackup => _backup;
  set setBackup(Backup backup) => _backup = backup;
}
