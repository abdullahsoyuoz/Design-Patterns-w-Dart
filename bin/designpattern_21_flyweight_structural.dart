void main(List<String> args) {
  var artboard = Artboard().Create();

  var a1 = Element(Elements.A);
  var a2 = Element(Elements.A);
  var a3 = Element(Elements.A);
  var b1 = Element(Elements.B);
  var b2 = Element(Elements.B);
  var c1 = Element(Elements.C);
  var d1 = Element(Elements.D);
  var d2 = Element(Elements.D);
  var d3 = Element(Elements.D);
  var d4 = Element(Elements.D);

  artboard.AddElement(a1);
  artboard.AddElement(a2);
  artboard.AddElement(a3);
  artboard.AddElement(b1);
  artboard.AddElement(b2);
  artboard.AddElement(c1);
  artboard.AddElement(d1);
  artboard.AddElement(d2);
  artboard.AddElement(d3);
  artboard.AddElement(d4);

  print('\nThe number of different elements created: ${artboard.CountElement}');
}

enum Elements { A, B, C, D }

abstract class ElementTemplate {
  void Use();
}

class Element extends ElementTemplate with Comparable {
  Elements type;
  Element(this.type);
  @override
  void Use() {
    print('${type.toString()} created and used.\tHashCode: ${hashCode}');
  }

  @override
  int compareTo(Object object) {
    if (object is Element) {
      var element = object;
      if (element.type == type) {
        return 1;
      } else {
        return 0;
      }
    } else {
      return -1;
    }
  }
}

class Artboard {
  Artboard artboard;
  static List<Element> list;
  int get CountElement => list.length;
  Artboard() {
    list = <Element>[];
  }

  Artboard Create() {
    artboard ??= Artboard();
    return artboard;
  }

  ElementTemplate AddElement(Element element) {
    ElementTemplate temp;
    for (var i = 0; i < list.length; i++) {
      if (list[i].compareTo(element) == 1) {
        temp = element;
        break;
      }
    }
    if (temp == null) {
      temp = Element(element.type);
      list.add(temp);
    }
    temp.Use();
    return temp;
  }
}
