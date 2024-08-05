import 'package:flutter/material.dart';
import 'package:yb_mobile/common_libs.dart';
import 'package:yb_mobile/src/common/widgets/header_auth_widget.dart';
import 'package:yb_mobile/src/features/authentication/sign_up/widgets/_sign_up_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(flex: 2, child: HeaderAuthWidget()),
          Expanded(flex: 10, child: SignUpFormWidget()),
        ],
      ),
    ));
  }
}
