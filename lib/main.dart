import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nfc_aqu/Login/LoginScreen.dart';
import 'package:nfc_aqu/Login/LoginService.dart';

final loginscreens = loginScreen();
void main() {
  GetIt.I.registerSingleton<loginService>(loginService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AquaCards NFC ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: loginScreen(),
    );
  }
}
