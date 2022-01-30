import 'dart:convert';
import 'package:xml/xml.dart';
import 'Model/17_adapter_model.dart';
import 'Mixins/AdapterMixin.dart';

void main(List<String> args) {
  XmlContactAdapter(XmlContactApi(xmlContact)).getContact();
  print('------------------------------------------');
  JsonContactAdapter(JsonContactApi(jsonContact)).getContact();
}

// ---------------------------------------------------------------------------------------------------

class IContactApi {
  final contact;
  IContactApi(this.contact);
}

class JsonContactApi extends IContactApi {
  JsonContactApi(contact) : super(contact);
  dynamic getContactsJson() => super.contact;
}

class XmlContactApi extends IContactApi {
  XmlContactApi(contact) : super(contact);
  dynamic getContactsXml() => super.contact;
}

// ---------------------------------------------------------------------------------------------------

abstract class IContactAdapter with AdapterToString {
  void getContact();
}

class JsonContactAdapter extends IContactAdapter {
  final JsonContactApi _api;
  JsonContactAdapter(this._api) {
    print('--- via JsonContactAdapter');
  }
  @override
  void getContact() => AdaptToString(_parseContactJson(_api.getContactsJson()));

  List<ContactModel> _parseContactJson(dynamic contactsJson) {
    var contactMap = json.decode(contactsJson) as Map<String, dynamic>;
    var contactJsonList = contactMap['contacts'] as List;
    var contactsList = contactJsonList
        .map((json) => ContactModel(
            name: json['name'], mail: json['mail'], company: json['company']))
        .toList();
    return contactsList;
  }
}

class XmlContactAdapter extends IContactAdapter {
  final XmlContactApi _api;
  XmlContactAdapter(this._api) {
    print('--- via XmlContactAdapter');
  }
  @override
  void getContact() => AdaptToString(_parseContactXml(_api.getContactsXml()));

  List<ContactModel> _parseContactXml(dynamic contactXml) {
    var xmlDocument = XmlDocument.parse(contactXml);
    var contactList = <ContactModel>[];
    for (var item in xmlDocument.findAllElements('contact')) {
      var name = item.findElements('name').single.text;
      var mail = item.findElements('mail').single.text;
      var company = item.findElements('company').single.text;

      contactList.add(ContactModel(
        name: name,
        mail: mail,
        company: company,
      ));
    }
    return contactList;
  }
}

