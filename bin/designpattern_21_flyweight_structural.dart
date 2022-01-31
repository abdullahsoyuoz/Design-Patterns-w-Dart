void main(List<String> args) {
  var artboard = Artboard().Create();

  var elementList = [
    Element(Elements.A),
    Element(Elements.A),
    Element(Elements.B),
    Element(Elements.C),
    Element(Elements.D),
    Element(Elements.D)
  ];

  elementList.forEach((element) {
    artboard.AddElement(element);
  });

  print(
      '\nThe number of different elements created: ${artboard.CountElement}\n');

  Artboard.list.forEach((element) {
    element.Use();
  });
}
// ---------------------------------------------------------------------------------------------------
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
// ---------------------------------------------------------------------------------------------------
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
