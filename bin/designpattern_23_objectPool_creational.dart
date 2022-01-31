void main(List<String> args) {
  var pool = ObjectPool();

  print('Free Pool count => ${pool.avaliableList.length}');
  print('Used Pool count => ${pool.usedList.length}');
  pool.getModel();
  print('Free Pool count => ${pool.avaliableList.length}');
  print('Used Pool count => ${pool.usedList.length}');
  pool.getModel();
  print('Free Pool count => ${pool.avaliableList.length}');
  print('Used Pool count => ${pool.usedList.length}');
  pool.beFree();
  print('Free Pool count => ${pool.avaliableList.length}');
  print('Used Pool count => ${pool.usedList.length}');
}

class SampleObject {
  int id;
  bool isAvaliable;
  SampleObject(this.id, this.isAvaliable);
}

class ObjectPool {
  List<SampleObject> usedList;
  List<SampleObject> avaliableList;
  int capacity = 3;

  ObjectPool() {
    usedList = <SampleObject>[];
    avaliableList = <SampleObject>[];

    for (var i = 0; i < capacity; i++) {
      avaliableList.add(SampleObject(i, true));
    }
  }

  void getModel() {
    if (avaliableList.isNotEmpty) {
      usedList.add(avaliableList.first);
      usedList.last.isAvaliable = false;  // !!!!
      avaliableList.remove(avaliableList.first);
      print('-----take an object from pool to be use');
    }
  }

  void beFree() {
    avaliableList.add(usedList.first);
    usedList.remove(usedList.first);
    avaliableList.last.isAvaliable = true;  // !!!!
    print('-----freed an object from used to be free');
  }
}
