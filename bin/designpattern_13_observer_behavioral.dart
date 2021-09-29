void main(List<String> args) {
  var modelList = [
    Model('Samsung Galaxy Series'),
    Model('Sony Xperia Series'),
    Model('LG G Series'),
    Model('Huawei Mate Series')
  ];

  var observerManager = ObserverManager();
  observerManager.modelList.addAll(modelList);
  observerManager.Notify('Upgrade to Android 10');
}

class ObserverManager {
  List<IModel> modelList;
  ObserverManager() {
    modelList = <IModel>[];
  }
  void AddModel(Model item) => modelList.add(item);
  void Notify(String message) {
    modelList.forEach((element) {
      element.Update(message);
    });
  }
}

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
