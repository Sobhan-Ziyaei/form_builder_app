import 'package:flutter/material.dart';
import 'package:form_builder_app/ui/constants/colors.dart';

class GreenButton extends StatelessWidget {
  GreenButton({Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);
  String buttonText;
  Function() onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SizedBox(
      height: size.height * 0.07,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: greenColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        onPressed: onPressed,
        child: Text(buttonText,
            style: theme.textTheme.bodySmall
                ?.copyWith(fontWeight: FontWeight.bold,fontSize: 12)),
      ),
    );
  }
}
