void main(List<String> args) {
  var sampleA = SampleModel('SampleA');
  var sampleRecycler = Recycler()..setBackup = sampleA.Recover();

  sampleA.name = 'SampleB';
  print(sampleA);

  sampleA.Restore(sampleRecycler._backup);
  print(sampleA);
}
// ---------------------------------------------------------------------------------------------------
class SampleModel {
  String name;
  SampleModel(String name) {
    this.name = name;
    print(this.toString());
  }
  void Restore(Backup backup) => name = backup.getName;
  Backup Recover() => Backup(name);

  @override
  String toString() => 'Güncel isim: $name | hashCode: ${this.hashCode}';
}
// ---------------------------------------------------------------------------------------------------
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
// ---------------------------------------------------------------------------------------------------
class Recycler {
  Backup _backup;
  Backup get getBackup => _backup;
  void set setBackup(Backup backup) => _backup = backup;
}
