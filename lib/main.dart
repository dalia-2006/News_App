import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_routes.dart';
import 'package:news_app/core/utils/app_theme.dart';
import 'package:news_app/features/auth/ui/login/loginScreen.dart';
import 'package:news_app/features/auth/ui/register/registerScreen.dart';
import 'package:news_app/features/home/ui/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginRouteName ,
      routes:{
        AppRoutes.loginRouteName :(context) => LoginScreen(),
        AppRoutes.registerRouteName : (context) => RegisterScreen(),
        AppRoutes.homeRouteName : (context) => HomeScreen(),

      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}



