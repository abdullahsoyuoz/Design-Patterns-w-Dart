void main(List<String> args) {
  var boss = Person('boss');
  var chef1 = Person('\tchef 1');
  var chef2 = Person('\tchef 2');
  var employee11 = Person('\t\temployee 11');
  var employee12 = Person('\t\temployee 12');
  var employee21 = Person('\t\temployee 21');
  var employee22 = Person('\t\temployee 22');

  boss.addSub(chef1);
  boss.addSub(chef2);
  chef1.addSub(employee11);
  chef1.addSub(employee12);
  chef2.addSub(employee21);
  chef2.addSub(employee22);

  boss.doAction();
}

// ---------------------------------------------------------------------------------------------------

abstract class ModelBase {
  String name;
  void doAction();
}

class Person implements ModelBase {
  @override
  String name;
  List<Person> subList;

  Person(this.name) {
    subList = <Person>[];
  }

  void addSub(Person item) => subList.add(item);

  @override
  void doAction() {
    print('$name action!');
    if (subList != null && subList.isNotEmpty) {
      subList.forEach((item) => item.doAction());
    }
  }
}
