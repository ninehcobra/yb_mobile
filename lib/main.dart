import 'package:yb_mobile/src/common/styles/theme.dart';
import 'package:yb_mobile/src/routing/app_router.dart';
import 'common_libs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Young Blood Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: RouterConstants.splash,
    );
  }
}
