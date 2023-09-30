import 'package:flutter/material.dart';
import 'package:form_builder_app/ui/constants/colors.dart';
import 'package:form_builder_app/ui/constants/strings.dart';

class FormCard extends StatelessWidget {
  String title;
  String description;
  Widget selectButton;
  Widget modifyButton;
  Widget formCount;
  Widget formRegister;
  FormCard({
    required this.title,
    required this.description,
    required this.selectButton,
    required this.modifyButton,
    required this.formCount,
    required this.formRegister,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: size.width,
        decoration: const BoxDecoration(
          color: cardBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                   Text(
                    '${FormScreenStrings.formTile} : ',
                    style: theme.textTheme.bodyMedium?.copyWith(color: redColor,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    title,
                    style: theme.textTheme.bodySmall?.copyWith(color: blackColor),
                  ),
                  const Spacer(),
                  formRegister,
                  const SizedBox(width: 10),
                  modifyButton,
                  const SizedBox(width: 10),
                  selectButton,
                  const SizedBox(width: 10),
                  formCount,
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                   Text(
                    '${FormScreenStrings.formDescription} : ',
                    style: theme.textTheme.bodyMedium?.copyWith(color: redColor,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    description,
                     style: theme.textTheme.bodySmall?.copyWith(color: blackColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
