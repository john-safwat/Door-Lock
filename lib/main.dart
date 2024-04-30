import 'package:doorlock/Theme/Theme.dart';
import 'package:doorlock/UI/ForgetPassword/ForgetPasswordView.dart';
import 'package:doorlock/UI/Home/HomeView.dart';
import 'package:doorlock/UI/Login/LoginView.dart';
import 'package:doorlock/UI/Registration/RegistrationView.dart';
import 'package:doorlock/UI/Splash/SplashView.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{

  // block the code building for the loading of data
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        SplashView.routeName :  (context) => const SplashView(),
        LoginView.routeName : (context) => LoginView(),
        RegistrationView.routeName : (context) => RegistrationView(),
        HomeView.routeName : (context) => HomeView(),
        ForgetPasswordView.routeName : (context) => ForgetPasswordView()
      },

      initialRoute: SplashView.routeName ,

    );
  }
}
