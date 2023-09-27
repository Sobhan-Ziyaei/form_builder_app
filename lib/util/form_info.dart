class FormInfo {
  int? id;
  late String title;
  late String description;
  List<FormFieldInfo>? formFields;
}

class FormFieldInfo {
  int? id;
  late int index;
  late String title;
  late String type;
  bool required = true;
  List<FormInfoValue>? values;
}

class FormInfoValue {
  int? id;
  late String value;
}
