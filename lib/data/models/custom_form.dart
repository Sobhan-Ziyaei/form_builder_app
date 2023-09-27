import 'package:form_builder_app/data/models/custom_form_field.dart';
import 'package:form_builder_app/data/models/custom_form_field_value.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class CustomForm {
  @Id()
  int id ;
  String? title ;
  String? description ;
  final customFormFields = ToMany<CustomFormField>();
  final customFormFieldValues = ToMany<CustomFormFieldValue>();
  CustomForm({this.id = 0 , this.title , this.description});
}