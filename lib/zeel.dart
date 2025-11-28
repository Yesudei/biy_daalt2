import 'package:flutter/material.dart';
import 'huselt.dart';
import 'package:flutter_svg/flutter_svg.dart';



class ZeelPage extends StatelessWidget {
  const ZeelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header section
            Container(
              width: double.infinity,
              height: 300,
              color: const Color(0xFFFAFBFB),
              child: Stack(
                children: [
                  // Logo example
                  Positioned(
                    left: 47,
                    top: 50,
                    child: SizedBox(
                      width: 120,
                      height: 40,
                      child: SvgPicture.asset(
                        'assets/images/logo.svg', // Replace with your logo
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // Page title
                  Positioned(
                    left: 26,
                    top: 120,
                    child: Text(
                      'Хялбар, хурдан, найдвартай зээл',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Section: Active Loans
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Таны идэвхитэй зээлүүд',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Loan Card 1
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF085544),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Дижитал зээлийн карт',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Хүчинтэй хугацаа 2025.05.09',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Нийт: 5,500,000₮',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Өдөрт төлөх: 500,000₮',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Loan Card 2
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAFBFB),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE7E8EC)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/loan_icon.svg', // Replace with actual asset
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Дижитал зээл',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '2025.01.01',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFB4B4B6),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          '300,000₮',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Loan Card 3
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAFBFB),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE7E8EC)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/loan_icon.svg', // Replace with actual asset
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Тэтгэврийн зээл',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '2025.01.01',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFB4B4B6),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          '200,000₮',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
