import 'package:technical_test/common_libs.dart';
import 'package:technical_test/features/splash/splash_page.dart';
import 'package:technical_test/themes/payuung_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: PayuungTheme.theme,
        home: const SplashPage(),
      ),
    );
  }
}
