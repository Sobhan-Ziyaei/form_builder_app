import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_app/gen/assets.gen.dart';
import 'package:form_builder_app/ui/constants/colors.dart';
import 'package:form_builder_app/ui/constants/strings.dart';
import 'package:form_builder_app/ui/screens/home_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  static const screenId = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateTo();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(Assets.lottie.formAnim, height: size.height * 0.50),
              SizedBox(height: size.height * 0.03),
              Text(SplashScreenStrings.splashLogo,
                  style: theme.textTheme.titleMedium),
              SizedBox(height: size.height * 0.03),
              const SpinKitSpinningLines(
                size: 50,
                color: blackColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> navigateTo() async {
    Future.delayed(
      const Duration(seconds: 5),
    ).then((value) {
      Navigator.pushNamed(context, HomeScreen.screenId);
    });
  }
}
