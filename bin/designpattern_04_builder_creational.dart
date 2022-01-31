import 'Model/Vehicle.dart';

void main(List<String> args) {
  var mercedes = VehicleBuilder().brandBuild('Mercedes').modelBuild('C63 Black Edition').priceBuild(258.000).build();
  var bmw = VehicleBuilder().brandBuild('BMW').modelBuild('M4 GTS').build();

  print(mercedes);
  print(bmw);
}
// ---------------------------------------------------------------------------------------------------
class VehicleBuilder {
  String brand;
  String model;
  double price;

  VehicleBuilder brandBuild(String data) {
    brand = data;
    return this;
  }

  VehicleBuilder modelBuild(String data) {
    model = data;
    return this;
  }

  VehicleBuilder priceBuild(double data) {
    price = data;
    return this;
  }

  Vehicle build() {
    return Vehicle(this);
  }
}
