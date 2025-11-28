import 'package:flutter/material.dart';
import 'main_page.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'zeel.dart'; // <-- added semicolon
import 'huselt.dart';
import 'hemjee.dart';
import 'tootsooluur.dart';
import 'tootsooluur_submit.dart';
import 'profile.dart';
import 'profile_extended.dart';
import 'personal_information.dart';
import 'contacts.dart';
import 'password_reset.dart';
import 'change_number.dart';
import 'verify.dart';
import 'info.dart';
import 'zeel_info.dart';
import 'tololt.dart';
import 'tololt2.dart';


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
        '/huselt': (context) => const HuseltPage(),
        '/hemjee': (context) => const HemjeePage(),
        '/tootsooluur': (context) => const TootsooluurPage(),
        '/tootsooluur_submit': (context) => const TootsooluurSubmitPage(),
        '/profile': (context) => const ProfilePage(),
        '/profile_extended': (context) => const ExtendedProfilePage(),
        '/personal_information': (context) => const PersonalInformationPage(),
        '/contacts': (context) => const ContactsPage(),
        '/password_reset': (context) => const PasswordResetPage(),
        '/change_number': (context) => const ChangeNumberPage(),
        '/verify': (context) => const VerifyNumberPage(),
        '/info': (context) => const InfoPage(),
        '/zeel_info': (context) => const ZeelInfoPage(),
        '/tololt': (context) => const TololtPage(),
        '/tololt2': (context) => const Tololt2Page(),

      },
    );
  }
}
