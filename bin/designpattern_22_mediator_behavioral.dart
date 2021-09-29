import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  var istanbulAirport = IstanbulControl();
  
  var plane1 = THY()
    ..airport = istanbulAirport
    ..flightNumber = 'ES2349'
    ..from = 'Roma';
  istanbulAirport.Register(plane1);

  var plane2 = THY()
    ..airport = istanbulAirport
    ..flightNumber = 'FG4599'
    ..from = 'London';
  istanbulAirport.Register(plane2);

  plane1.RequestNewWay('34:43E;41:41W');
  plane2.RequestNewWay('34:43E;41:41W');
}

abstract class IAirport {
  Map<String, IAirline> _planes;
  void Register(IAirline airline);
  void SuggestWay(String flightNumber, String way);
}

class IstanbulControl extends IAirport {
  IstanbulControl() {
    _planes = <String, IAirline>{};
  }
  
  @override
  void Register(IAirline airline) {
    if (!_planes.containsValue(airline)) {
      _planes[airline.flightNumber] = airline;
    }
    airline.airport = this;
  }

  @override
  void SuggestWay(String fligthNumber, String way) {
    sleep(Duration(milliseconds: 1000));
    _planes[fligthNumber].GetWay(
        '${Random().nextInt(50).toString()}:${Random().nextInt(50).toString()}E;${Random().nextInt(50).toString()}:${Random().nextInt(50).toString()}W');
  }
}

abstract class IAirline {
  IAirport _airport;
  IAirport get airport => _airport;
  set airport(IAirport value) => _airport = value;
  String flightNumber;
  String from;
  void RequestNewWay(String myWay) {
    _airport.SuggestWay(flightNumber, myWay);
  }

  void GetWay(String msgFromControl) {
    print('${msgFromControl} rotasına yönelmeniz gerekmekte...');
  }
}

class THY extends IAirline {
  @override
  void GetWay(String msgFromControl) {
    print('THY, #${flightNumber}, from: ${from}');
    super.GetWay(msgFromControl);
  }
}
