import 'package:form_builder_app/data/models/custom_form.dart';
import 'package:form_builder_app/data/models/custom_form_field.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class CustomFormFieldValue {
  @Id()
  int id;
  String value;
  final customForm = ToOne<CustomForm>();
  final customFormField = ToOne<CustomFormField>();

  CustomFormFieldValue({
    this.id = 0,
    required this.value,
  });
}