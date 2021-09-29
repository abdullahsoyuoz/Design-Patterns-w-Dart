void main(List<String> args) {
  var juniorJack = Junior(Person('Jack', 45));
  var seniorMatt = Senior(Person('Matt', 90));

  juniorJack.setSenior(seniorMatt);
  juniorJack.Handle();
}

class Person {
  String name;
  int ability;
  Person(this.name, this.ability);
}

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
    print('${person.name} is trying to handle it !');
    if (person.ability < 50) {
      print('To make this handle for the ability must be 50 or higher. Because ${person.name}\'s ability ${person.ability}.');
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
