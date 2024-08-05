import 'package:flutter/material.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    // TODO: implement dispose
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
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
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
        Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: TextField(
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                hintText: "Repeat your password",
                labelText: "Re-type password",
                prefixIcon: const Icon(Icons.lock),
              ),
            )),
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
                  child: const Text("Sign Up"))),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("If you already have an account?"),
            Container(
              margin: const EdgeInsets.only(left: 2),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/sign_in");
                  },
                  child: const Text(
                    "Login Now",
                    style: TextStyle(color: Colors.blue),
                  )),
            )
          ],
        )
      ],
    );
  }
}
