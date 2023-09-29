import 'package:flutter/material.dart';
import 'package:form_builder_app/data/models/custom_form.dart';
import 'package:form_builder_app/data/models/custom_form_field.dart';
import 'package:form_builder_app/data/models/custom_form_field_value.dart';
import 'package:form_builder_app/main.dart';
import 'package:form_builder_app/ui/constants/colors.dart';
import 'package:form_builder_app/ui/constants/strings.dart';
import 'package:form_builder_app/ui/widgets/green_button.dart';
import 'package:form_builder_app/ui/widgets/orange_button.dart';
import 'package:form_builder_app/util/form_info.dart';

class RegisterFormScreen extends StatefulWidget {
  RegisterFormScreen({Key? key}) : super(key: key);
  static const screenId = '/register_form_screen';
  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreenState();
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {
  final formBox = objectBox.store.box<CustomForm>();
  final formFieldBox = objectBox.store.box<CustomFormField>();
  final formFieldValueBox = objectBox.store.box<CustomFormFieldValue>();
  CustomForm? userFormInfo;
  CustomFormField? userFormFieldInfo;
  List<FormFieldInfo> formFieldInfos = [];
  List<List<Widget>> dropdownTextField = [];
  late TextEditingController formTitleController;
  late TextEditingController formDescriptionController;

  //for singleText
  bool isSingleTextClick = false;
  var counterSingleText = 0;

  //for multiText
  bool isMultiTextClick = false;
  var counterMultipleText = 0;

  //for dropdown
  bool isDropDownClick = false;
  var counterDropdown = 0;

  var counter = 0;
  @override
  void initState() {
    super.initState();
    formTitleController = TextEditingController();
    formDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    formTitleController.dispose();
    formDescriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        endDrawer: const Drawer(),
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.01),
              child: Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: const Icon(Icons.menu, color: blackColor),
                  );
                },
              ),
            ),
          ],
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
            RegisterFormScreenStrigns.registerFormAppbarTitle,
            style: theme.textTheme.titleSmall,
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.05),
                    MainTextField(
                      controller: formTitleController,
                      hint: RegisterFormScreenStrigns.inputFormTitle,
                    ),
                    SizedBox(height: size.height * 0.03),
                    MainTextField(
                      controller: formDescriptionController,
                      hint: RegisterFormScreenStrigns.inputFormDescription,
                    ),
                    SizedBox(height: size.height * 0.07),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OrangeButton(
                          buttonText: RegisterFormScreenStrigns.singleText,
                          onPressed: () {
                            setState(() {
                              isSingleTextClick = true;
                              FormFieldInfo formFieldInfo = FormFieldInfo();
                              formFieldInfo.index = counter;
                              formFieldInfo.type = 'Single_text';
                              formFieldInfo.title = '';
                              formFieldInfos.add(formFieldInfo);
                              counter++;
                              counterSingleText++;
                            });
                          },
                        ),
                        OrangeButton(
                          buttonText: RegisterFormScreenStrigns.multiText,
                          onPressed: () {
                            setState(() {
                              isMultiTextClick = true;
                              FormFieldInfo formFieldInfo = FormFieldInfo();
                              formFieldInfo.index = counter;
                              formFieldInfo.type = 'Multi_text';
                              formFieldInfo.title = '';
                              formFieldInfos.add(formFieldInfo);
                              counter++;
                              counterMultipleText++;
                            });
                          },
                        ),
                        OrangeButton(
                          buttonText: RegisterFormScreenStrigns.dropdown,
                          onPressed: () {
                            setState(() {
                              isDropDownClick = true;
                              FormFieldInfo formFieldInfo = FormFieldInfo();
                              formFieldInfo.index = counter;
                              formFieldInfo.type = 'dropdown';
                              formFieldInfo.title = '';
                              formFieldInfo.values = [];
                              formFieldInfos.add(formFieldInfo);
                              counter++;
                              counterDropdown++;
                              dropdownTextField.add([]);
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(height: size.height * 0.05),
                    //if user have singleText
                    Column(
                      children: [
                        isSingleTextClick == true
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: counterSingleText,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SubFormField(
                                    formFieldInfos: formFieldInfos,
                                    counter: counter,
                                    titleText: RegisterFormScreenStrigns
                                        .fieldSingleTitle,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        isMultiTextClick == true
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: counterMultipleText,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SubFormField(
                                    formFieldInfos: formFieldInfos,
                                    counter: counter,
                                    titleText: RegisterFormScreenStrigns
                                        .fieldMultiTitle,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        isDropDownClick == true
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: counterDropdown,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: addNewDropdown(
                                    index,
                                    counter,
                                    size,
                                    theme,
                                    RegisterFormScreenStrigns.dropdownTitle,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    //-------------------------
                    SizedBox(height: size.height * 0.05),
                    GreenButton(
                      buttonText: RegisterFormScreenStrigns.save,
                      onPressed: () {
                        saveForm(
                          formTitleController.text,
                          formDescriptionController.text,
                        );
                        for (var i = 0; i < formFieldInfos.length; i++) {
                          saveFormField(i);
                          if (formFieldInfos[i].values != null) {
                            saveFormFieldValue(i);
                          }
                        }
                      },
                    ),
                    SizedBox(height: size.height * 0.07),
                    GreenButton(
                      buttonText: 'خواندن',
                      onPressed: () {
                        print(formFieldInfos);
                      },
                    ),
                    SizedBox(height: size.height * 0.07),
                    GreenButton(
                      buttonText: 'حذف کردن',
                      onPressed: () {
                        formBox.removeAll();
                        formFieldBox.removeAll();
                        formFieldValueBox.removeAll();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveForm(String title, String description) {
    CustomForm form = CustomForm();
    setState(() {
      FormInfo formInfo = FormInfo();
      formInfo.title = title;
      formInfo.description = description;
      formInfo.formFields = [];
      userFormInfo = form;

      form.title = formInfo.title;
      form.description = formInfo.description;
    });
    formBox.put(form);
  }

  void saveFormField(int index) {
    CustomFormField customFormField = CustomFormField();
    setState(() {
      customFormField.title = formFieldInfos[index].title;
      customFormField.type = formFieldInfos[index].type;
      customFormField.customForm.target = userFormInfo;
      userFormInfo?.customFormFields.add(customFormField);
      formFieldBox.put(customFormField);
      formBox.put(userFormInfo!);
      setState(() {
        userFormFieldInfo = customFormField;
      });
    });
  }

  void saveFormFieldValue(int index) {
    setState(
      () {
        for (var i = 0; i < formFieldInfos.length; i++) {
          if (formFieldInfos[i].values != null) {
            for (var j = 0; j < formFieldInfos[i].values!.length; j++) {
              var formFieldValueId = formFieldInfos[i].values![j].id;
              var formInfoValue = formFieldInfos[i].values![j];

              var customFormFieldValue = CustomFormFieldValue();
              customFormFieldValue.value = formInfoValue.value;
              customFormFieldValue.customForm.target = userFormInfo;
              customFormFieldValue.customFormField.target = userFormFieldInfo;
              formFieldBox.put(userFormFieldInfo!);
              formBox.put(userFormInfo!);

              if (formFieldValueId == null) {
                // Save the form field value only if it's a new value
                formFieldValueBox.put(customFormFieldValue);
                formInfoValue.id =
                    customFormFieldValue.id; // Update the value's ID
                formFieldBox.put(
                    userFormFieldInfo!); // Update the form field with the new value
              }
            }
          }
        }
      },
    );
  }

  Widget addNewDropdown(
      int dropdownIndex, int id, Size size, ThemeData theme, String titleText) {
    return Column(
      children: [
        TextField(
          style: theme.textTheme.bodySmall
              ?.copyWith(color: blackColor, fontSize: 20),
          onChanged: (value) {
            formFieldInfos[id - 1].title = value;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: size.height * 0.03),
            border: const OutlineInputBorder(),
            hintText: titleText,
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
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                addNewTextField(dropdownIndex, id, size, theme);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        ...dropdownTextField[dropdownIndex],
      ],
    );
  }

  void addNewTextField(
      int dropdownIndex, int fieldId, Size size, ThemeData theme) {
    setState(
      () {
        var formFieldValueId = formFieldInfos[fieldId - 1].values?.length ?? 0;
        FormInfoValue formInfoValue = FormInfoValue();
        formInfoValue.value = '';
        formFieldInfos[fieldId - 1].values?.add(formInfoValue);
        dropdownTextField[dropdownIndex].add(
          Padding(
            padding: EdgeInsets.only(bottom: size.width * 0.01),
            child: TextField(
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: blackColor, fontSize: 20),
              onChanged: (value) {
                formFieldInfos[fieldId - 1].values?[formFieldValueId].value =
                    value;
                print(formFieldInfos);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.03),
                border: const OutlineInputBorder(),
                labelText: '${formFieldValueId + 1}',
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
            ),
          ),
        );
      },
    );
  }
}

class SubFormField extends StatelessWidget {
  const SubFormField({
    super.key,
    required this.formFieldInfos,
    required this.counter,
    required this.titleText,
  });

  final List<FormFieldInfo> formFieldInfos;
  final int counter;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return TextField(
      style:
          theme.textTheme.bodySmall?.copyWith(color: blackColor, fontSize: 20),
      onChanged: (value) {
        formFieldInfos[counter - 1].title = value;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        border: const OutlineInputBorder(),
        hintText: titleText,
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
    );
  }
}

class MainTextField extends StatelessWidget {
  MainTextField({
    super.key,
    required this.controller,
    required this.hint,
  });

  final TextEditingController controller;
  String hint;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      style:
          theme.textTheme.bodySmall?.copyWith(color: blackColor, fontSize: 20),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        hintText: hint,
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
    );
  }
}
