import '../../../common_libs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/sign_in');
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
