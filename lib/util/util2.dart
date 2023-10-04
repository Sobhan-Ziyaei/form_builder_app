import 'package:form_builder_app/data/models/custom_form.dart';
import 'package:form_builder_app/main.dart';
import 'package:form_builder_app/util/form_info.dart';

FormInfo makeFormInfo(int id) {
  final formBox = objectBox.store.box<CustomForm>();
  var f = formBox.get(id);
  FormInfo o = FormInfo();
  o.id = id;
  o.title = f!.title!;
  o.description = f.description!;
  o.formFields = [];
  var i = 0;
  for (var k in f.customFormFields) {
    FormFieldInfo z = FormFieldInfo();
    z.id = k.id;
    z.index = i;
    z.required = k.isRequired ?? false;
    z.title = k.title!;
    z.type = k.type!;
    List<FormInfoValue> values = [];
    for (var p in k.customFormFieldValues) {
      FormInfoValue t = FormInfoValue();
      t.id = p.id;
      t.value = p.value!;
      values.add(t);
    }
    z.values = values;
    o.formFields!.add(z);
  }

  return o;
}
