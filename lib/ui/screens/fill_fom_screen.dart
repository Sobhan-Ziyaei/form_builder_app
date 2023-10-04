import 'package:flutter/material.dart';
import 'package:form_builder_app/data/models/custom_form.dart';
import 'package:form_builder_app/data/models/custom_form_field.dart';
import 'package:form_builder_app/data/models/custom_form_field_value.dart';
import 'package:form_builder_app/data/models/user_form_values.dart';
import 'package:form_builder_app/data/models/user_forms.dart';
import 'package:form_builder_app/main.dart';
import 'package:form_builder_app/ui/constants/colors.dart';
import 'package:form_builder_app/ui/constants/strings.dart';
import 'package:form_builder_app/ui/widgets/green_button.dart';
import 'package:form_builder_app/util/form_info.dart';
import 'package:form_builder_app/util/user_form_info.dart';
import 'package:form_builder_app/util/util.dart';
import 'package:form_builder_app/util/util2.dart';

class FillFormScreen extends StatefulWidget {
  FillFormScreen({Key? key, required this.selectFormId}) : super(key: key);
  static const screenId = '/fill_form_screen';
  final int selectFormId;
  @override
  State<FillFormScreen> createState() => _FillFormScreenState();
}

class _FillFormScreenState extends State<FillFormScreen> {
  final FormInfoValue emptyFormFieldValue = FormInfoValue();
  final formBox = objectBox.store.box<CustomForm>();
  final formFieldBox = objectBox.store.box<CustomFormField>();
  final formFieldValueBox = objectBox.store.box<CustomFormFieldValue>();
  final userFormBox = objectBox.store.box<UserForms>();
  final userFormValuesBox = objectBox.store.box<UserFormValues>();
  late UserFormInfo form;
  var counter = 0;
  var userFormFieldValueId = 0;
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    emptyFormFieldValue.id = 0;
    emptyFormFieldValue.value = '';
    form = makeUserFormInfo(makeFormInfo(widget.selectFormId));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:
                const Icon(Icons.arrow_back_ios_new_rounded, color: blackColor),
          ),
          centerTitle: true,
          title: Text(
            FillFormScreenStrings.fillFormAppbarTitle,
            style: theme.textTheme.titleSmall,
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.05),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: form.formFields!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.03),
                        child: getFormContentWidget(index, theme, size),
                      );
                    },
                  ),
                  SizedBox(height: size.height * 0.05),
                  GreenButton(
                    buttonText: FormScreenStrings.fillForm,
                    onPressed: () {
                      print(form);
                      saveForm();
                      //userFormBox.removeAll();
                      //userFormValuesBox.removeAll();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveForm() {
    UserForms userForm = UserForms();
    userForm.date = DateTime.now().toString(); // Assign the appropriate date

    for (var element in form.formFields!) {
      UserFormValues userFormValues = UserFormValues();

      if (element.type == 'Single_text' || element.type == 'Multi_text') {
        userFormValues.stringVal = element.stringVal;
        userFormValues.numberVal = null;
        userFormValues.itemId = null;
      } else {
        //userFormValues.stringVal = null;
        userFormValues.stringVal = element.stringVal ;
      }
      userFormValues.itemId = element.itemId;
      userFormValues.userForm.target = userForm;
      userFormValues.customForm.target = formBox.get(form.id!);
      userForm.userFormValues.add(userFormValues);
      userFormBox.put(userForm);
      userFormValuesBox.put(userFormValues);
    }
  }

  Widget getFormContentWidget(int index, ThemeData theme, Size size) {
    switch (form.formFields![index].type) {
      case 'Single_text':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${FormContentScreenStrings.type} ${RegisterFormScreenStrigns.singleText}',
              style: theme.textTheme.bodyMedium?.copyWith(color: redColor),
            ),
            SizedBox(height: size.height * 0.01),
            TextFormField(
              onChanged: (value) {
                form.formFields![index].stringVal = value;
              },
              style: theme.textTheme.bodyMedium?.copyWith(color: blackColor),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.03),
                labelText: form.formFields![index].title,
                labelStyle: theme.textTheme.bodyMedium
                    ?.copyWith(color: blackColor, fontSize: 18),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: blackColor, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: greenColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        );
      case 'Multi_text':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${FormContentScreenStrings.type} ${RegisterFormScreenStrigns.multiText}',
              style: theme.textTheme.bodyMedium?.copyWith(color: redColor),
            ),
            SizedBox(height: size.height * 0.01),
            TextFormField(
              onChanged: (value) {
                form.formFields![index].stringVal = value;
              },
              style: theme.textTheme.bodyMedium?.copyWith(color: blackColor),
              maxLines: 3,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.03),
                labelText: form.formFields![index].title,
                labelStyle: theme.textTheme.bodyMedium
                    ?.copyWith(color: blackColor, fontSize: 18),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: blackColor, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: greenColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        );
      case 'dropdown':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${FormContentScreenStrings.type} ${RegisterFormScreenStrigns.dropdown}',
              style: theme.textTheme.bodyMedium?.copyWith(color: redColor),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              '${FormContentScreenStrings.title} ${form.formFields![index].title}',
              style: theme.textTheme.bodyMedium?.copyWith(color: blackColor),
            ),
            SizedBox(height: size.height * 0.03),
            DropdownButtonFormField<FormInfoValue>(
              style: theme.textTheme.bodySmall?.copyWith(color: blackColor),
              value: form.formFields![index].values![0],
              items: form.formFields![index].values!.map((formFieldValue) {
                return DropdownMenuItem<FormInfoValue>(
                  value: formFieldValue,
                  child: Text(formFieldValue.value),
                );
              }).toList(),
              onChanged: (newValue) {
                form.formFields![index].itemId = newValue!.id;
                form.formFields![index].stringVal = newValue.value ;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }
}
