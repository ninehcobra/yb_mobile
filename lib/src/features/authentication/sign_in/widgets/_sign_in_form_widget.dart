import 'package:flutter/material.dart';
import 'package:yb_mobile/src/features/authentication/sign_in/widgets/_third_party_auth_widget.dart';

class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({super.key});

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  hintText: "Type your email",
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email)),
            )),
        Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                hintText: "Type your password",
                labelText: "Password",
                prefixIcon: const Icon(Icons.lock),
              ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: true, onChanged: (bool? value) {}),
                const Text("Remember me"),
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgot_password');
                },
                child: const Text("Forgot Password?"))
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    print("Email: ${_emailController.text}");
                    print("Password: ${_passwordController.text}");
                  },
                  child: const Text("Sign In"))),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 35),
          child: const Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("OR", style: TextStyle(color: Colors.grey)),
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
        ThirdPartyAuthWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            Container(
              margin: const EdgeInsets.only(left: 2),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/sign_up");
                  },
                  child: const Text(
                    "Register Now",
                    style: TextStyle(color: Colors.blue),
                  )),
            )
          ],
        )
      ],
    );
  }
}
