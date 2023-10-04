

import 'package:form_builder_app/util/form_info.dart';
import 'package:form_builder_app/util/user_form_info.dart';

UserFormInfo makeUserFormInfo(FormInfo formInfo)
{
  UserFormInfo f = UserFormInfo();
  f.id = formInfo.id;
  f.formFields = convertFormFieldToUserFormField((formInfo.formFields)!) ;
  f.description = formInfo.description ;
  f.title = formInfo.title ;
  return f;
}

List<UserFormFieldInfo> convertFormFieldToUserFormField(List<FormFieldInfo> f)
{
  List<UserFormFieldInfo> o = [];
  for (var z in f) {
    UserFormFieldInfo k = UserFormFieldInfo();
    k.id = z.id;
    k.index = z.index ;
    k.required = z.required ;
    k.title = z.title ;
    k.type = z.type ;
    k.values = z.values ;

    o.add(k);
  }
  return o;
}