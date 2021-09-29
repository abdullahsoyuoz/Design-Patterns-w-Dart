void main(List<String> arguments) {
  var sampleProviderA = SampleProvider(SampleA());
  sampleProviderA.Process();

  var sampleProviderB = SampleProvider(SampleB());
  sampleProviderB.Process();
}

class SampleProvider {  // DEPENDENCY INJECTION
  final ISample _iSample;
  SampleProvider(this._iSample);
  void Process() => _iSample.Process();
}

class ISample {
  void Process() {
    print('At runtime this process not running...');
  }
}

class SampleA implements ISample {
  SampleA() {
    print('SampleA object is constructed...');
  }

  @override
  void Process() {
    print('SampleA Process() is running...');
  }
}

class SampleB implements ISample {
  SampleB() {
    print('SampleB object is constructed...');
  }
  @override
  void Process() {
    print('SampleB Process() is running...');
  }
}
