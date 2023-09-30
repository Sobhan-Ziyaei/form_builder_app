import 'package:flutter/material.dart';
import 'package:form_builder_app/data/models/custom_form.dart';
import 'package:form_builder_app/data/models/custom_form_field.dart';
import 'package:form_builder_app/data/models/custom_form_field_value.dart';
import 'package:form_builder_app/main.dart';
import 'package:form_builder_app/objectbox.g.dart';
import 'package:form_builder_app/ui/constants/colors.dart';
import 'package:form_builder_app/ui/constants/strings.dart';

class FormContentScreen extends StatefulWidget {
  FormContentScreen({Key? key, required this.selectForm}) : super(key: key);
  static const screenId = '/form_content_screen';
  final int selectForm;
  @override
  State<FormContentScreen> createState() => _FormContentScreenState();
}

class _FormContentScreenState extends State<FormContentScreen> {
  final formBox = objectBox.store.box<CustomForm>();
  final formFieldBox = objectBox.store.box<CustomFormField>();
  final formFieldValueBox = objectBox.store.box<CustomFormFieldValue>();
  List<CustomFormField> customFormFields = [];
  List<CustomFormFieldValue> customFormFieldValues = [];
  String? dropdownValue;
  @override
  void initState() {
    super.initState();
    getFormContentData();
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
            FormContentScreenStrings.formContentList,
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
                    itemCount: customFormFields.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.03),
                        child: getFormContentWidget(
                            customFormFields[index], theme, size),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getFormContentData() {
    // Clear existing data
    customFormFields.clear();
    customFormFieldValues.clear();

    // Query for CustomFormField
    QueryBuilder<CustomFormField> builder = formFieldBox.query();
    builder.link(CustomFormField_.customForm,
        CustomForm_.title.equals(formBox.get(widget.selectForm)!.title!));
    Query<CustomFormField> query = builder.build();
    customFormFields.addAll(query.find());

    for (CustomFormField customFormField in query.find()) {
      for (CustomFormFieldValue customFormFieldValue
          in customFormField.customFormFieldValues) {
        customFormFieldValues.add(customFormFieldValue);
      }
    }
  }

  Widget getFormContentWidget(
      CustomFormField customFormField, ThemeData theme, Size size) {
    int index = customFormFields.indexOf(customFormField);
    if (index >= 0 && index < customFormFields.length) {
      switch (customFormField.type) {
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
                style: theme.textTheme.bodyMedium?.copyWith(color: blackColor),
                initialValue: customFormField.title,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.03),
                  hintStyle: theme.textTheme.bodyMedium
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
                style: theme.textTheme.bodyMedium?.copyWith(color: blackColor),
                maxLines: 3,
                initialValue: customFormField.title,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.03),
                  hintStyle: theme.textTheme.bodyMedium
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
          // Filter the customFormFieldValues list based on the current customFormField
          List<CustomFormFieldValue> filteredValues = customFormFieldValues
              .where((value) =>
                  value.customFormField.targetId == customFormField.id)
              .toList();

          // Check if dropdownValue is a valid value, if not, use the first value from filteredValues
          CustomFormFieldValue? selectedValue;
          if (dropdownValue == null ||
              !filteredValues.any((value) => value.value == dropdownValue)) {
            selectedValue = filteredValues.first;
            dropdownValue = selectedValue.value;
          } else {
            selectedValue = filteredValues
                .firstWhere((value) => value.value == dropdownValue);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${FormContentScreenStrings.type} ${RegisterFormScreenStrigns.dropdown}',
                style: theme.textTheme.bodyMedium?.copyWith(color: redColor),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                '${FormContentScreenStrings.title} ${customFormField.title!}',
                style: theme.textTheme.bodyMedium?.copyWith(color: blackColor),
              ),
              SizedBox(height: size.height * 0.03),
              DropdownButtonFormField<CustomFormFieldValue>(
                style: theme.textTheme.bodySmall?.copyWith(color: blackColor),
                value: selectedValue,
                items: filteredValues.map((customFormFieldValue) {
                  return DropdownMenuItem<CustomFormFieldValue>(
                    value: customFormFieldValue,
                    child: Text(customFormFieldValue.value ?? ''),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue?.value;
                  });
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
    return Container();
  }
}
