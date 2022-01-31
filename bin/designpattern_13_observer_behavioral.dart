// ignore_for_file: unused_local_variable
void main(List<String> args) {
  var modelList = [
    Model('Samsung Galaxy Series'),
    Model('Sony Xperia Series'),
    Model('Huawei Mate Series')
  ];

  var observerManager = ObserverManager()
    ..AddModels(modelList)
    ..Notify('\t--Upgrade to new Android!');
}
// ---------------------------------------------------------------------------------------------------
class ObserverManager {
  List<IModel> modelList = <IModel>[];
  ObserverManager();
  void AddModels(List<Model> items) => modelList.addAll(items);
  void Notify(String message) {
    modelList.forEach((element) {
      element.Update(message);
    });
  }
}
// ---------------------------------------------------------------------------------------------------
class IModel {
  void Update(String message) {}
}

class Model implements IModel {
  String modelTitle;
  Model(this.modelTitle);
  @override
  void Update(String message) {
    print('$modelTitle $message');
  }
}
