import 'package:ecommerce_mobile/features/splash/splash_screen.dart';
import 'package:ecommerce_mobile/preferences/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        fontFamily: 'Josefin Sans',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14),
            backgroundColor: Color(0xffFFA451),
            foregroundColor: Color(0xffFFFFFF),
            textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: MainColors.primaryColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 14),
            foregroundColor: MainColors.primaryColor,
            textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Color(0xffF3F1F1),
          filled: true,
          hintStyle: TextStyle(
            color: Color(0xffC2BDBD),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: MainColors.primaryColor,
          centerTitle: true,
          toolbarHeight: 100,
          surfaceTintColor: MainColors.primaryColor,
          leadingWidth: 150,
        )
      ),
      
      home: SplashScreen(),
    );
  }
}





