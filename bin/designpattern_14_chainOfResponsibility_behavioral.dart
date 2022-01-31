import 'Model/Employee.dart';

void main(List<String> args) {
  var employeeJames = Junior(Employee('Employee James', 45));
  var seniorMatt = Senior(Employee('Chef Matt', 90));
  var employeeKemal = Junior(Employee('Employee JsonKemal', 55));

  employeeJames.setSenior(seniorMatt);
  employeeJames.Handle();
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
  Employee employee;
  Junior(this.employee);

  @override
  void Handle() {
    print('${employee.name} is trying.. ability : ${employee.ability}');
    if (employee.ability < 50) {
      print('${employee.name}\'s can\'t do this because insufficient ability!');
      _senior.Handle();
    } else if (employee != null) {
      print('Handled from ${employee.name}');
    }
  }
}

class Senior extends PositionBase {
  Employee employee;

  Senior(this.employee);

  @override
  void Handle() {
    print('Handled from ${employee.name}');
  }
}
