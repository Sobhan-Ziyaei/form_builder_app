import 'package:flutter/material.dart';
import 'package:form_builder_app/data/models/custom_form.dart';
import 'package:form_builder_app/data/models/custom_form_field.dart';
import 'package:form_builder_app/data/models/custom_form_field_value.dart';
import 'package:form_builder_app/main.dart';
import 'package:form_builder_app/ui/constants/colors.dart';
import 'package:form_builder_app/ui/constants/strings.dart';

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

  late TextEditingController formTitleController;
  late TextEditingController formDescriptionController;
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
                  ],
                ),
              ),
            ),
          ),
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

  void saveForm(String title, String description) {
    var form = CustomForm(title: title, description: description);
  }
}
