void main(List<String> args) {
  var redTable = Product('table', 'for 4 person', 'red');
  var greenTable = redTable.clone()..color="green";
  var blueTable = Product('table', 'for six person', 'blue');

  print(redTable);
  print('-- Green Table clone from Red Table');
  print(greenTable);
  print(blueTable);
}

// ---------------------------------------------------------------------------------------------------

abstract class Model {
  String title;
  String description;
  Model clone();
}

// ---------------------------------------------------------------------------------------------------

class Product implements Model {
  @override
  String title;
  @override
  String description;
  String color;
  int productHashCode;
  bool isClone = false;

  Product(this.title, this.description, this.color);

  Product.fromSource(Product source) {
    title = source.title;
    description = source.description;
    color = source.color;
    productHashCode = source.hashCode;
    isClone = true;
  }

  @override
  Product clone() {
    return Product.fromSource(this);
  }

  @override
  String toString() {
    return "${this.color} ${this.title} \t| \thashCode: ${this.hashCode}";
  }

  @override
  int get hashCode {
    if (productHashCode != null) return productHashCode;
    return productHashCode = DateTime.now().millisecondsSinceEpoch;
  }
}
