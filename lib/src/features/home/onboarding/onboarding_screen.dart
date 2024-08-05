import 'package:yb_mobile/common_libs.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/images/welcome.png')),
            Column(
              children: [
                Center(
                    child: Text(
                  'Welcome to YBE',
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Center(
                      child: Text(
                    'Your one-stop destination for hasstle-free online shopping',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  )),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouterConstants.signInOptions);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Get Started',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
