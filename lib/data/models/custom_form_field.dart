import 'package:form_builder_app/data/models/custom_form.dart';
import 'package:form_builder_app/data/models/custom_form_field_value.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class CustomFormField {
  @Id()
  int id;
  String? title;
  bool? isRequired;
  String? type;

  final customForm = ToOne<CustomForm>();
  final customFormFieldValues = ToMany<CustomFormFieldValue>();
  CustomFormField({
    this.id = 0,
    this.title,
    this.isRequired,
    this.type,
  });
}