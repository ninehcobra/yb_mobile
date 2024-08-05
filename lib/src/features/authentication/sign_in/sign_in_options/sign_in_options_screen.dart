import 'package:yb_mobile/src/common/widgets/custom_button.dart';

import '../../../../../common_libs.dart';

class SignInOptionsScreen extends StatefulWidget {
  const SignInOptionsScreen({super.key});

  @override
  State<SignInOptionsScreen> createState() => _SignInOptionsScreenState();
}

class _SignInOptionsScreenState extends State<SignInOptionsScreen> {
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
                "Login to YBE",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 42,
              ),
              CustomButton(
                  title: "Login with Google",
                  textColor: AppColors.neutralColor950,
                  iconImage: Image.asset(
                    "assets/images/google.png",
                  ).image),
              const SizedBox(
                height: 18,
              ),
              CustomButton(
                  title: "Login with Apple",
                  textColor: AppColors.neutralColor950,
                  iconImage: Image.asset(
                    "assets/images/apple.png",
                  ).image),
              const SizedBox(
                height: 42,
              ),
              const Row(
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
              const SizedBox(
                height: 42,
              ),
              CustomButton(
                title: "Login with Email",
                textColor: AppColors.neutralColor50,
                backgroundColor: AppColors.primaryColor700,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouterConstants.signInWithEmail);
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouterConstants.signUpWithEmail);
                    },
                    child: Text(
                      "Sign up",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.primaryColor700),
                    ))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
