import 'package:flutter/material.dart';
import 'package:greengrocer/src/views/auth/sign_in_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final int primary = 0xFF1F1F1F;
  final int secondary = 0xFF1F1F1F;
  final int backgroundColor = 0xFF1F1F1F;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.green),
          scaffoldBackgroundColor: Colors.white.withAlpha(190)),
      debugShowCheckedModeBanner: false,
      home: const SignInScreen(),
    );
  }
}
