import 'package:yb_mobile/src/common/widgets/custom_button.dart';
import 'package:yb_mobile/src/common/widgets/custom_text_field.dart';

import '../../../../../common_libs.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = false;
  bool _isEmailError = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }

  void _validateEmail() {
    setState(() {
      if (_emailController.text.isEmpty) {
        _isEmailError = true;
        _isEmailValid = false;
      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
          .hasMatch(_emailController.text)) {
        _isEmailError = true;
        _isEmailValid = false;
      } else {
        _isEmailError = false;
        _isEmailValid = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reset Your Password",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: AppColors.neutralColor950),
            ),
            const SizedBox(height: 20),
            Text(
              "Enter your email address and we'll send you instructions to reset your password.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 42),
            CustomTextField(
              hintText: "Type your email",
              labelText: "Email",
              prefixIcon: Icons.email_outlined,
              controller: _emailController,
              isError: _isEmailError,
              isCorrect: _isEmailValid,
              errorValue: "Invalid email format",
            ),
            const SizedBox(height: 40),
            CustomButton(
              title: "Reset Password",
              disabled: !_isEmailValid,
              onPressed: () {
                if (_isEmailValid) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Password Reset Email Sent"),
                        content: Text(
                            "Check your email for instructions to reset your password."),
                        actions: <Widget>[
                          TextButton(
                            child: TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouterConstants.confirmOtp);
                              },
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              backgroundColor: AppColors.primaryColor700,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.removeListener(_validateEmail);
    _emailController.dispose();
    super.dispose();
  }
}
