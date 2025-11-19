import 'package:flutter/material.dart';
import 'main_page.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'zeel.dart'; // <-- added semicolon

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Default start page
      home: const MainPage(),

      // Registered routes
      routes: {
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/zeel': (context) => const ZeelPage(), // optional route
      },
    );
  }
}
