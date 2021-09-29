import 'dart:convert';
import 'package:xml/xml.dart';

import 'Data/data.dart';

void main(List<String> args) {
  XmlContactAdapter(XmlContactApi(xmlContact)).getContact().forEach((element) {
    print('${element.name.toString()}, ${element.mail.toString()}, ${element.company.toString()}');
  });

  print('\n--------\n');
  JsonContactAdapter(JsonContactApi(jsonContact))
      .getContact()
      .forEach((element) {
    print('${element.name.toString()}, ${element.mail.toString()}, ${element.company.toString()}');
  });
}

class Contact {
  final String name;
  final String mail;
  final String company;
  const Contact({this.name, this.mail, this.company});
}

class JsonContactApi {
  final String contactsJSON;
  JsonContactApi(this.contactsJSON);
  String getContactsJson() => contactsJSON;
}

class XmlContactApi {
  final String contacsXML;
  XmlContactApi(this.contacsXML);
  String getContactsXml() => contacsXML;
}

abstract class IContactAdapter {
  List<Contact> getContact();
}

class JsonContactAdapter implements IContactAdapter {
  final JsonContactApi _api;
  JsonContactAdapter(this._api) {
    print('--- via JsonContactAdapter');
  }
  @override
  List<Contact> getContact() {
    var contactJson = _api.getContactsJson();
    var contactList = _parseContactJson(contactJson);

    return contactList;
  }

  List<Contact> _parseContactJson(String contactsJson) {
    var contactMap = json.decode(contactsJson) as Map<String, dynamic>;
    var contactJsonList = contactMap['contacts'] as List;
    var contactsList = contactJsonList
        .map((json) => Contact(
            name: json['name'], mail: json['mail'], company: json['company']))
        .toList();

    return contactsList;
  }
}

class XmlContactAdapter implements IContactAdapter {
  final XmlContactApi _api;
  XmlContactAdapter(this._api) {
    print('--- via XmlContactAdapter');
  }
  @override
  List<Contact> getContact() {
    var contactXml = _api.getContactsXml();
    var contactList = _parseContactXml(contactXml);

    return contactList;
  }

  List<Contact> _parseContactXml(String contactXml) {
    var xmlDocument = XmlDocument.parse(contactXml);
    var contactList = <Contact>[];
    for (var item in xmlDocument.findAllElements('contact')) {
      var name = item.findElements('name').single.text;
      var mail = item.findElements('mail').single.text;
      var company = item.findElements('company').single.text;

      contactList.add(Contact(
        name: name,
        mail: mail,
        company: company,
      ));
    }

    return contactList;
  }
}
