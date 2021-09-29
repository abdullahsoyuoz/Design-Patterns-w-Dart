void main(List<String> args) {
  var macbook16 = Macbook('Apple', 'Macbook Pro', 2.8, 16);
  print('${macbook16.brand} ${macbook16.model} ${macbook16.cpuClockBase.toString()} Ghz ${macbook16.ramMemoryCapacity.toInt().toString()} Gb Memory\n');
  macbook16 = IncreaseMemory(macbook16, 32);
  print('DEBUG : LATEST - macbook ram capacity: ' +
      macbook16.ramMemoryCapacity.toString());
  var newMacbook = macbook16;
  newMacbook = IncreaseCpuClockBase(newMacbook, 3.20);
  print('\n${newMacbook.brand} ${newMacbook.model} ${newMacbook.cpuClockBase.toString()} Ghz ${newMacbook.ramMemoryCapacity.toInt().toString()} Gb Memory');
}

class Macbook {
  // ReProducible..
  String brand;
  String model;
  double cpuClockBase;
  double ramMemoryCapacity;

  Macbook(this.brand, this.model, this.cpuClockBase, this.ramMemoryCapacity);

  void run() {
    print('${brand} ${model} : MacOs is Running');
  }
}

class IncreaseMemory extends Macbook {
  Macbook macbook;
  double increase;
  IncreaseMemory(this.macbook, this.increase)
      : super(macbook.brand, macbook.model, macbook.cpuClockBase, increase) {
    print('increased !');
    macbook.ramMemoryCapacity = increase;
    print('increase amount: ' + increase.toString());
  }
}

class IncreaseCpuClockBase extends Macbook {
  Macbook macbook;
  double increase;
  IncreaseCpuClockBase(this.macbook, this.increase)
      : super(
            macbook.brand, macbook.model, increase, macbook.ramMemoryCapacity) {
    print('increased !');
    macbook.cpuClockBase = increase;
    print('increase amount: ' + increase.toString());
  }
}
