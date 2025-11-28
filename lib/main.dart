import 'package:flutter/material.dart';
import 'main_page.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'zeel.dart';
import 'huselt.dart';
import 'hemjee.dart';
import 'profile.dart';
import 'personal_information.dart';
import 'contacts.dart';
import 'password_reset.dart';
import 'change_number.dart';
import 'verify.dart';
import 'info.dart';
import 'zeel_info.dart';
import 'tololt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      routes: {
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/zeel': (context) => const ZeelPage(),
        '/huselt': (context) => const HuseltPage(),
        '/hemjee': (context) => const HemjeePage(),
        '/profile': (context) => const ProfilePage(),
        '/personal_information': (context) => const PersonalInformationPage(),
        '/contacts': (context) => const ContactsPage(),
        '/password_reset': (context) => const PasswordResetPage(),
        '/change_number': (context) => const ChangeNumberPage(),
        '/verify': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return VerifyNumberPage(phoneNumber: args);
        },
        '/info': (context) => const InfoPage(),
        // ZeelInfoPage requires parameters, so pass default values or use arguments
        '/zeel_info': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
          return ZeelInfoPage(
            title: args?['title'] ?? 'Дижитал зээл',
            date: args?['date'] ?? '2025.01.01',
            amount: args?['amount'] ?? '300,000₮',
          );
        },
        '/tololt': (context) => const TololtPage(),
      },
    );
  }
}
