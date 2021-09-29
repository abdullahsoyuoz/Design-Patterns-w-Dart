void main(List<String> args) {
  var modelA = ModelA('a');
  var modelA1 = ModelA('\ta1');
  var modelA2 = ModelA('\ta2');
  var modelA11 = ModelA('\t\ta11');
  var modelA12 = ModelA('\t\ta12');
  var modelA21 = ModelA('\t\ta21');
  var modelA22 = ModelA('\t\ta22');

  modelA.addSub(modelA1);
  modelA.addSub(modelA2);
  modelA1.addSub(modelA11);
  modelA1.addSub(modelA12);
  modelA2.addSub(modelA21);
  modelA2.addSub(modelA22);

  modelA.doAction();
}

abstract class ModelBase {
  String name;
  void doAction();
}

class ModelA implements ModelBase {
  @override
  String name;
  List<ModelA> subList;

  ModelA(this.name) {
    subList = <ModelA>[];
  }

  void addSub(ModelA item) => subList.add(item);

  @override
  void doAction() {
    print('$name action!');
    if (subList != null && subList.isNotEmpty) {
      subList.forEach((item) => item.doAction());
    }
  }
}
