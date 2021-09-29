void main(List<String> args) {
  var pool = SamplePool();

  pool.avaliableList.forEach((element) =>
      print('avaliable => ${element.id} : ${element.isAvaliable}'));
  print('------------------------------------');
  pool.getModel();
  pool.avaliableList.forEach((element) =>
      print('avaliable => ${element.id} : ${element.isAvaliable}'));
  print('------------------------------------');
  pool.usedList.forEach(
      (element) => print('used => ${element.id} : ${element.isAvaliable}'));
  print('------------------------------------');
  pool.getModel();
  pool.avaliableList.forEach((element) =>
      print('avaliable => ${element.id} : ${element.isAvaliable}'));
  print('------------------------------------');
  pool.usedList.forEach(
      (element) => print('used => ${element.id} : ${element.isAvaliable}'));
  print('------------------------------------');
  pool.beFree();
  pool.avaliableList.forEach((element) =>
      print('avaliable => ${element.id} : ${element.isAvaliable}'));
  print('------------------------------------');
  pool.usedList.forEach(
      (element) => print('used => ${element.id} : ${element.isAvaliable}'));
  print('------------------------------------');
}

class SampleModel {
  int id;
  bool isAvaliable;
  SampleModel(this.id, this.isAvaliable);
}

class SamplePool {
  List<SampleModel> usedList;
  List<SampleModel> avaliableList;
  int capacity = 2;

  SamplePool() {
    usedList = <SampleModel>[];
    avaliableList = <SampleModel>[];

    for (var i = 0; i < capacity; i++) {
      avaliableList.add(SampleModel(i, true));
    }
  }

  void getModel() {
    if (avaliableList.isNotEmpty) {
      usedList.add(avaliableList.first);
      usedList.last.isAvaliable = false;
      avaliableList.remove(avaliableList.first);
    }
  }

  void beFree() {
    avaliableList.add(usedList.first);
    usedList.remove(usedList.first);
    avaliableList.last.isAvaliable = true;
  }
}
