void main(List<String> args) {
  var sampleA = SingletonObject();
  var sampleB = SingletonObject();
  print('----------');
  print('identical? : ${identical(sampleA, sampleB)}\n\n');
}

class SingletonObject {
  static final SingletonObject _singletonObject = SingletonObject._internal();
  factory SingletonObject() {
    print('${_singletonObject.hashCode} constructed...');
    return _singletonObject;
  }
  SingletonObject._internal();
}
