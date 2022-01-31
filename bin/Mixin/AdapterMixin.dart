mixin AdapterToString {
  AdaptToString(dynamic item) {
    item.forEach((element) {
      print(
          '${element.name.toString()}, ${element.mail.toString()}, ${element.company.toString()}');
    });
  }
}