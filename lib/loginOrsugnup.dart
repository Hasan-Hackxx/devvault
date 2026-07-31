import 'package:devvault/login_Page.dart';
import 'package:devvault/signup_Page.dart';
import 'package:flutter/widgets.dart';

class Loginorsugnup extends StatefulWidget {
  const Loginorsugnup({super.key});

  @override
  State<Loginorsugnup> createState() => _LoginorsugnupState();
}

class _LoginorsugnupState extends State<Loginorsugnup> {
  bool switchPage = true;

  @override
  Widget build(BuildContext context) {
    void togglebetweenPages() {
      setState(() {
        switchPage = !switchPage;
      });
    }

    if (switchPage) {
      return LoginPage(onTap: togglebetweenPages);
    } else {
      return SignupPage(onTap: togglebetweenPages);
    }
  }
}
