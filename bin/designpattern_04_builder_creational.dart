void main(List<String> args) {
  var person = PersonBuilder().name('Barış').surname('Manço').age(22).builder();
  print('${person.name}, ${person.surname}, ${person.age},');
}

class Person {
  String name;
  String surname;
  int age;
  Person(PersonBuilder builder) {
    name = builder._name;
    surname = builder._surname;
    age = builder._age;
  }
}

class PersonBuilder {
  String _name;
  String _surname;
  int _age;

  PersonBuilder name(String name) {
    _name = name;
    return this;
  }

  PersonBuilder surname(String surname) {
    _surname = surname;
    return this;
  }

  PersonBuilder age(int age) {
    _age = age;
    return this;
  }

  Person builder() {
    return Person(this);
  }
}
