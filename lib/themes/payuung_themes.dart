import 'package:technical_test/common_libs.dart';

class PayuungTheme {
  PayuungTheme._();

  static final ThemeData theme = ThemeData.from(
    colorScheme: const ColorScheme(
      primary: ColorName.primaryColor, // Varian utama jika diperlukan
      secondary: ColorName.secondaryColor, // Varian sekunder jika diperlukan
      surface: ColorName.white, // Warna latar belakang
      error: Colors.red, // Warna untuk error
      onPrimary: ColorName.black, // Teks di atas primaryColor
      onSecondary: ColorName.black, // Teks di atas secondaryColor
      onSurface: Colors.black, // Teks di atas background
      onError: Colors.white, // Teks di atas error color
      brightness: Brightness.light, // Brightness (light/dark mode)
    ),
  ).copyWith(
    primaryColor: ColorName.primaryColor, // Warna primaryColor di seluruh app
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ColorName.primaryColor), // Warna kursor di text field
    highlightColor:
        ColorName.primaryColor, // Warna highlight (misalnya ripple effect)
  );
}
