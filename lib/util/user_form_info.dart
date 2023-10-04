import 'dart:ffi';

import 'package:form_builder_app/util/form_info.dart';

class UserFormInfo {
  int? id;
  late String title;
  late String description;
  List<UserFormFieldInfo>? formFields;
}

class UserFormFieldInfo {
  int? id;
  late int index;
  late String title;
  late String type;
  bool required = true;
  List<FormInfoValue>? values;
  String? stringVal;
  double? numberVal;
  int? itemId;
}
