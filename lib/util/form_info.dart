class FormInfo {
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
