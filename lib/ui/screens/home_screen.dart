import 'package:flutter/material.dart';
import 'package:form_builder_app/gen/assets.gen.dart';
import 'package:form_builder_app/ui/constants/colors.dart';
import 'package:form_builder_app/ui/constants/strings.dart';
import 'package:form_builder_app/ui/screens/register_form_screen.dart';
import 'package:form_builder_app/ui/widgets/black_button.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const screenId = '/home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: size.width * 0.05),
              Text(
                HomeScreenStrings.homeAppbarTitle,
                style: theme.textTheme.titleSmall,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Lottie.asset(Assets.lottie.homeAnim),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BlackButton(
                        buttonText: HomeScreenStrings.createForm,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterFormScreen.screenId);
                        },
                      ),
                      BlackButton(
                        buttonText: HomeScreenStrings.reportForms,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BlackButton(
                        buttonText: HomeScreenStrings.modifyForm,
                        onPressed: () {},
                      ),
                      BlackButton(
                        buttonText: HomeScreenStrings.reportForms,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
