import 'package:flutter/material.dart';
import 'register_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFB),
      body: Stack(
        children: [
          // Back icon placeholder (optional)
          Positioned(
            left: 44,
            top: 80,
            child: SizedBox(
              width: 40,
              height: 30,
              child: SvgPicture.asset(
                'assets/images/back_icon.svg', // replace with your asset
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Main Logo
          Positioned(
            left: 47,
            top: 203,
            child: SizedBox(
              width: 288,
              height: 62,
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Title
          Positioned(
            top: 326,
            left: 47,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Өнөөдрөөс шинэ",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "боломжуудаа нээ!",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Subtitle
          Positioned(
            top: 431,
            left: 47,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Санхүүгийн боловсролоо дээшлүүлж,",
                  style: TextStyle(fontSize: 16, color: Color(0xFF6E7074)),
                ),
                SizedBox(height: 6),
                Text(
                  "зээлийн ухаалаг сонголтуудаас",
                  style: TextStyle(fontSize: 16, color: Color(0xFF6E7074)),
                ),
                SizedBox(height: 6),
                Text(
                  "суралцаарай!",
                  style: TextStyle(fontSize: 16, color: Color(0xFF6E7074)),
                ),
              ],
            ),
          ),

          // Continue Button
          Positioned(
            left: 44,
            top: 810,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              child: Container(
                width: 340,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6D31),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Үргэлжлүүлэх",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      'assets/images/white_arrow.svg',
                      width: 20,
                      height: 15,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
