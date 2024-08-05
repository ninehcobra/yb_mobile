import 'package:yb_mobile/common_libs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this as TickerProvider,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context)
              .pushReplacementNamed('/onboarding'); // Navigate to home screen
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor700,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: Icon(
                          Icons.shopify,
                          color: AppColors.neutralColor50,
                          size: 52,
                        ),
                      ),
                      Text(
                        'YB-Ecommerce',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return LinearProgressIndicator(
                      value: _animation.value,
                      backgroundColor:
                          AppColors.neutralColor50.withOpacity(0.3),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.neutralColor50),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
