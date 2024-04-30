import 'package:doorlock/Theme/Theme.dart';
import 'package:doorlock/UI/Login/LoginView.dart';
import 'package:doorlock/UI/Splash/SplashView.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.theme,
      routes: {
        SplashView.routeName :  (context) => SplashView(),
        LoginView.routeName : (context) => LoginView()
      },

      initialRoute: SplashView.routeName ,

    );
  }
}
