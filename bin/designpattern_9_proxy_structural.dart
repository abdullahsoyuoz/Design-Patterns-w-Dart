import 'dart:io';

void main(List<String> args) {
  var spp = SampleProcessProxy();
  spp.Calculate('test');
  spp.Calculate('test');
  spp.Calculate('testDifferent');
  spp.Calculate('testDifferent');
  spp.Calculate('test');
  spp.Calculate('testDifferent');
}

class IProcess {
  // ignore: missing_return
  String Calculate(String message) {}
}

class SampleProcess implements IProcess {
  @override
  String Calculate(String message) {
    sleep(Duration(seconds: 2)); // LONG PROCESS SIMULATION
    print('$message from Calculate()');
    return message;
  }
}

class SampleProcessProxy implements IProcess {
  SampleProcess sampleProcess;
  String cache;

  @override
  String Calculate(String message) {
    if (cache == null) {
      sampleProcess = SampleProcess();
      cache = sampleProcess.Calculate(message);
      return message;
    }
    if (cache != message) {
      sampleProcess = SampleProcess();
      cache = sampleProcess.Calculate(message);
      return message;
    } else {
      print('$cache from cache value');
      return cache;
    }
  }
}
