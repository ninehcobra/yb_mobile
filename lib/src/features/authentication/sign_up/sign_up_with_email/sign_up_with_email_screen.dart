import 'package:yb_mobile/src/common/widgets/custom_button.dart';
import 'package:yb_mobile/src/common/widgets/custom_text_field.dart';

import '../../../../../common_libs.dart';

class SignUpWithEmailScreen extends StatefulWidget {
  const SignUpWithEmailScreen({super.key});

  @override
  State<SignUpWithEmailScreen> createState() => _SignUpWithEmailScreenState();
}

class _SignUpWithEmailScreenState extends State<SignUpWithEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isEmailValid = false;
  bool _isEmailError = false;
  bool _isPasswordValid = false;
  bool _isPasswordError = false;
  bool _isConfirmPasswordValid = false;
  bool _isConfirmPasswordError = false;
  bool _isTermsAccepted = false;
  bool _showTermsError = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
    _passwordController.addListener(_validatePassword);
    _confirmPasswordController.addListener(_validateConfirmPassword);
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
    _validateConfirmPassword();
  }

  void _validateConfirmPassword() {
    setState(() {
      if (_confirmPasswordController.text != _passwordController.text) {
        _isConfirmPasswordError = true;
        _isConfirmPasswordValid = false;
      } else {
        _isConfirmPasswordError = false;
        _isConfirmPasswordValid = true;
      }
    });
  }

  bool _areFieldsValid() {
    return _isEmailValid && _isPasswordValid && _isConfirmPasswordValid;
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
                  "Sign Up with Email",
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
                CustomTextField(
                  hintText: "Confirm your password",
                  labelText: "Confirm Password",
                  prefixIcon: Icons.lock_outline,
                  controller: _confirmPasswordController,
                  isPassword: true,
                  isError: _isConfirmPasswordError,
                  isCorrect: _isConfirmPasswordValid,
                  errorValue: "Passwords do not match",
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _isTermsAccepted,
                      onChanged: (value) {
                        setState(() {
                          _isTermsAccepted = value ?? false;
                          _showTermsError = false;
                        });
                      },
                    ),
                    const Text('Agree with'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouterConstants.termsAndConditions);
                      },
                      child: Text(
                        'Terms & Conditions',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.primaryColor700),
                      ),
                    ),
                  ],
                ),
                if (_showTermsError)
                  Text(
                    'Please accept the Terms & Conditions',
                    style: TextStyle(color: AppColors.errorColor500),
                  ),
                const SizedBox(height: 40),
                CustomButton(
                  title: "Sign Up",
                  disabled: !_areFieldsValid(),
                  onPressed: () {
                    if (_areFieldsValid()) {
                      if (!_isTermsAccepted) {
                        setState(() {
                          _showTermsError = true;
                        });
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Sign Up Successful"),
                              content:
                                  Text("Welcome, ${_emailController.text}!"),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  },
                  backgroundColor: AppColors.primaryColor700,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  child: Text(
                    "Sign in here",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColors.primaryColor700),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RouterConstants.signInWithEmail);
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
    _confirmPasswordController.removeListener(_validateConfirmPassword);
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
