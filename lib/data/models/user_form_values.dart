
import 'package:form_builder_app/data/models/custom_form.dart';
import 'package:form_builder_app/data/models/custom_form_field.dart';
import 'package:form_builder_app/data/models/user_forms.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UserFormValues {
  @Id()
  int id;
  String? stringVal;
  double? numberVal;
  int? itemId;

  final userForm = ToOne<UserForms>();
  final customForm = ToOne<CustomForm>();
  final customFormField = ToOne<CustomFormField>();

  UserFormValues({
    this.id = 0,
    this.stringVal,
    this.numberVal,
    this.itemId,
  });
}
