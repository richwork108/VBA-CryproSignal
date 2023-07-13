import 'package:flutter/material.dart';
import 'package:metrdev/appcolors.dart';
import 'package:metrdev/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VBA CryptoSignal',
      theme: ThemeData(primarySwatch: AppColor.primary_swatch),
      home: const LoginPage(),
    );
  }
}
