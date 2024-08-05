import 'package:yb_mobile/src/common/widgets/custom_button.dart';
import 'package:yb_mobile/src/common/widgets/custom_text_field.dart';

import '../../../../../common_libs.dart';

class SignInWithEmailScreen extends StatefulWidget {
  const SignInWithEmailScreen({super.key});

  @override
  State<SignInWithEmailScreen> createState() => _SignInWithEmailScreenState();
}

class _SignInWithEmailScreenState extends State<SignInWithEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isEmailValid = false;
  bool _isEmailError = false;
  bool _isPasswordValid = false;
  bool _isPasswordError = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
    _passwordController.addListener(_validatePassword);
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

  void _validatePassword() {
    setState(() {
      if (_passwordController.text.isEmpty) {
        _isPasswordError = true;
        _isPasswordValid = false;
      } else if (_passwordController.text.length < 6) {
        _isPasswordError = true;
        _isPasswordValid = false;
      } else {
        _isPasswordError = false;
        _isPasswordValid = true;
      }
    });
  }

  bool _areFieldsValid() {
    return _isEmailValid && _isPasswordValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login with Email",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: AppColors.neutralColor950),
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
                CustomTextField(
                  hintText: "Type your password",
                  labelText: "Password",
                  prefixIcon: Icons.lock_outline,
                  controller: _passwordController,
                  isPassword: true,
                  isError: _isPasswordError,
                  isCorrect: _isPasswordValid,
                  errorValue: "Password must be at least 6 characters",
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      "Forgot password?",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouterConstants.forgotPassword);
                    },
                  ),
                ),
                const SizedBox(height: 40),
                CustomButton(
                  title: "Sign In",
                  disabled: !_areFieldsValid(),
                  onPressed: () {
                    if (_areFieldsValid()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            content: SizedBox(
                              height: 155,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.check_circle,
                                      color: AppColors.successColor600,
                                      size: 50),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Login Successful!',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Done',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  backgroundColor: AppColors.primaryColor700,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account yet?"),
                TextButton(
                  child: Text(
                    "Sign up here",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColors.primaryColor700),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, RouterConstants.signUpWithEmail);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.removeListener(_validateEmail);
    _passwordController.removeListener(_validatePassword);
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
