void main(List<String> args) {
  var macbook16 = Computer('Apple', 'Macbook Pro', 2.8, 16);
  print(macbook16);
  macbook16 = IncreaseMemory(macbook16, 32);
  print('DEBUG : LATEST - macbook ram capacity: ' + macbook16.ramMemoryCapacity.toString());
}

// ---------------------------------------------------------------------------------------------------

class Computer {
  String brand;
  String model;
  double cpuClockBase;
  double ramMemoryCapacity;

  Computer(this.brand, this.model, this.cpuClockBase, this.ramMemoryCapacity);

  void run() {
    print('${brand} ${model} : MacOs is Running');
  }

  @override
  String toString() {
    return '${this.brand} ${this.model} ${this.cpuClockBase.toString()} Ghz ${this.ramMemoryCapacity.toInt().toString()} Gb Memory';
  }
}

// ---------------------------------------------------------------------------------------------------

class IncreaseMemory extends Computer {
  Computer instance;
  double increase;
  IncreaseMemory(this.instance, this.increase) : super(instance.brand, instance.model, instance.cpuClockBase, increase) {
    instance.ramMemoryCapacity = increase;
    print('increase amount: ' + increase.toString());
  }
}
