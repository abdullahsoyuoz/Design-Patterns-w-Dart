void main(List<String> args) {
  var redTable = Product('table', 'for 4 person', 'red', 23);
  var greenTable = redTable.clone();
  var blueTable = Product('table', 'for six person', 'blue', 33);

  print('Green Table clone from Red Table');
  print(greenTable.hashCode);
  print(redTable.hashCode);
  print(blueTable.hashCode);
}

abstract class Model {
  String title;
  String description;
  Model clone();
}

class Product implements Model {
  @override
  String title;
  @override
  String description;
  String color;
  double price;
  int productHashCode;
  bool isClone = false;

  Product(this.title, this.description, this.color, this.price);

  Product.fromSource(Product source) {
    title = source.title;
    description = source.description;
    color = source.color;
    price = source.price;
    productHashCode = source.hashCode;
    isClone = true;
  }

  @override
  Product clone() {
    return Product.fromSource(this);
  }

  @override
  int get hashCode {
    if (productHashCode != null) return productHashCode;
    return productHashCode = DateTime.now().millisecondsSinceEpoch;
  }
}
