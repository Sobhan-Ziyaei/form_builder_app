import 'package:form_builder_app/data/models/custom_form.dart';
import 'package:form_builder_app/data/models/user_form_values.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UserForms {
  @Id()
  int id;
  String? date;
  final userFormValues = ToMany<UserFormValues>();
  final customForm = ToOne<CustomForm>();

  UserForms({
    this.id = 0,
    this.date,
  });
}
