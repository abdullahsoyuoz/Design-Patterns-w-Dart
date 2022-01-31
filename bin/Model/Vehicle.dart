import '../designpattern_04_builder_creational.dart';

class Vehicle {
  String brand;
  String model;
  double price;

  Vehicle(VehicleBuilder builder) {
    brand = builder.brand;
    model = builder.model;
    price = builder.price;
  }

  @override
  String toString() {
    return "$brand $model -- ${price != null ? price : 'price unknown!'}${price != null ? '\$' : ' '}";
  }
}