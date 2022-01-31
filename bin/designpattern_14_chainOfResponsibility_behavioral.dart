import 'Model/Person.dart';

void main(List<String> args) {
  var employeeJack = Junior(Person('Employee Jack', 45));
  var seniorMatt = Senior(Person('Chef Matt', 90));
  var employeeKemal = Junior(Person('Employee Kemal', 55));

  employeeJack.setSenior(seniorMatt);
  employeeJack.Handle();
  employeeKemal.setSenior(seniorMatt);
  employeeKemal.Handle();
}
// ---------------------------------------------------------------------------------------------------
class PositionBase {
  PositionBase _senior;
  void setSenior(PositionBase senior) => _senior = senior;
  void Handle() {
    print('Handled !!');
  }
}

class Junior extends PositionBase {
  Person person;
  Junior(this.person);

  @override
  void Handle() {
    print('${person.name} is trying.. ability : ${person.ability}');
    if (person.ability < 50) {
      print('${person.name}\'s can\'t do this because insufficient ability!');
      _senior.Handle();
    } else if (person != null) {
      print('Handled from ${person.name}');
    }
  }
}

class Senior extends PositionBase {
  Person person;

  Senior(this.person);

  @override
  void Handle() {
    print('Handled from ${person.name}');
  }
}
