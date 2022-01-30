void main(List<String> args) {
  var listofEntity = <EntityBase>[
    EntityBase(0),
    EntityBase(1),
    EntityBase(2),
  ];

  var mapofEntity = <int, EntityBase>{
    0: EntityBase(3),
    1: EntityBase(4),
    2: EntityBase(5),
  };

  var list = EntityList();
  list.Setter(listofEntity);

  var map = EntityMap();
  map.Setter(mapofEntity);

  SampleIterator(listofEntity).GetEntity(list.Getter());
  SampleIterator(mapofEntity.values.toList()).GetEntity(map.Getter());
}

// CUSTOM ENUMARATOR
abstract class IEnumarator {
  bool hasNext();
  Object getNext();
  void reset();
}

class SampleIterator implements IEnumarator {
  List<EntityBase> list;
  int index = 0;

  SampleIterator(List<EntityBase> item) {
    list = item;
  }

  @override
  Object getNext() {
    var item = list[index];
    index++;
    return item;
  }

  @override
  bool hasNext() {
    if (index < list.length) {
      return true;
    } else {
      reset();
    }
    return false;
  }

  @override
  void reset() => index = 0;

  void GetEntity(IEnumarator item) {
    while (item.hasNext()) {
      var current = item.getNext() as EntityBase;
      print(current.id.toString());
    }
  }
}

class EntityBase {
  int id;
  EntityBase(this.id);
}

class EntityList {
  List<EntityBase> list;
  EntityList() {
    list = <EntityBase>[];
  }
  SampleIterator Getter() => SampleIterator(list);
  void Setter(List<EntityBase> item) => list = item;
}

class EntityMap {
  Map<int, EntityBase> list;
  EntityMap() {
    list = <int, EntityBase>{};
  }
  SampleIterator Getter() => SampleIterator(list.values.toList());
  void Setter(Map<int, EntityBase> item) => list = item;
}
