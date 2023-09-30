import 'package:flutter/material.dart';
import 'package:form_builder_app/data/models/custom_form.dart';
import 'package:form_builder_app/main.dart';
import 'package:form_builder_app/ui/constants/colors.dart';
import 'package:form_builder_app/ui/constants/strings.dart';
import 'package:form_builder_app/ui/widgets/form_card.dart';

class FormScreen extends StatefulWidget {
  FormScreen({Key? key}) : super(key: key);
  static const screenId = 'form_screen';

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formBox = objectBox.store.box<CustomForm>();
  List<CustomForm> customForms = [];
  @override
  void initState() {
    super.initState();
    getFormData();
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
            FormScreenStrings.formList,
            style: theme.textTheme.titleSmall,
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            ListView.builder(
              itemCount: customForms.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: size.height * 0.02,
                      right: size.width * 0.03,
                      left: size.width * 0.03),
                  child: FormCard(
                    title: customForms[index].title ?? '',
                    description: customForms[index].description ?? '',
                    selectButton:
                        BlueCircleButton(text: FormScreenStrings.formContent),
                    modifyButton:
                        BlueCircleButton(text: FormScreenStrings.formModify),
                    formCount: const SizedBox(),
                    formRegister: const SizedBox(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void getFormData() {
    for (CustomForm customForm in formBox.getAll()) {
      customForms.add(customForm);
    }
  }
}

class BlueCircleButton extends StatelessWidget {
  String text;
  BlueCircleButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Container(
      width: size.width * 0.05,
      height: size.height * 0.05,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: blueColor,
      ),
      child: Center(
        child: Text(
          text,
          style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
        ),
      ),
    );
  }
}
