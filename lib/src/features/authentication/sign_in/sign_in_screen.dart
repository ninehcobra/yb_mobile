import 'package:flutter/material.dart';
import 'package:yb_mobile/src/common/widgets/header_auth_widget.dart';
import 'package:yb_mobile/src/features/authentication/sign_in/widgets/_sign_in_form_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(flex: 2, child: HeaderAuthWidget()),
          Expanded(flex: 10, child: SignInFormWidget()),
        ],
      ),
    ));
  }
}
