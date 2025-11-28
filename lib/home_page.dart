import 'package:flutter/material.dart';
import 'huselt.dart';
import 'profile.dart';
import 'info.dart';
import 'zeel_info.dart'; // <-- ZeelInfoPage

// ---------------- ACTIVE LOANS WIDGET ----------------
class ActiveLoansWidget extends StatelessWidget {
  const ActiveLoansWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 190,
          height: 22,
          child: const Text(
            'Таны идэвхитэй зээлүүд',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w800,
              height: 1.38,
              letterSpacing: -0.48,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 264,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: _loanCard(
                  context: context,
                  title: 'Дижитал зээл',
                  date: '2025.01.01',
                  amount: '300,000₮',
                  iconUrl: 'https://placehold.co/24x24',
                ),
              ),
              Positioned(
                left: 0,
                top: 92,
                child: _loanCard(
                  context: context,
                  title: 'Машины зээл',
                  date: '2025.01.01',
                  amount: '20,000,000₮',
                  iconUrl: 'https://placehold.co/24x24',
                ),
              ),
              Positioned(
                left: 0,
                top: 184,
                child: _loanCard(
                  context: context,
                  title: 'Тэтгэврийн зээл',
                  date: '2025.01.01',
                  amount: '200,000₮',
                  iconUrl: 'https://placehold.co/24x24',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _loanCard({
    required BuildContext context,
    required String title,
    required String date,
    required String amount,
    required String iconUrl,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ZeelInfoPage(
              title: title,
              date: date,
              amount: amount,
            ),
          ),
        );
      },
      child: Container(
        width: 396,
        height: 80,
        decoration: ShapeDecoration(
          color: const Color(0xFFFAFBFB),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: Color(0xFFE7E8EC),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 24,
              top: 28,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(iconUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 74,
              top: 18,
              child: SizedBox(
                width: 120,
                height: 17,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 1.57,
                    letterSpacing: -0.48,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 74,
              top: 41,
              child: Text(
                date,
                style: const TextStyle(
                  color: Color(0xFFB4B4B6),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 3,
                  letterSpacing: -0.24,
                ),
              ),
            ),
            Positioned(
              left: 274,
              top: 35,
              child: SizedBox(
                width: 88,
                height: 21,
                child: Text(
                  amount,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 1.22,
                    letterSpacing: -0.48,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- HOME PAGE ----------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(context),
          const SizedBox(height: 20),

          // ---------------- PROFILE SECTION ----------------
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilePage()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF3F2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/img_5.png"),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      "Ө.СҮХ-ОЧИР\nХувийн мэдээлэл рүү орох",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 18),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ---------------- MAIN LOAN BANNER ----------------
          const Text(
            "Зээлийн бүтээгдэхүүн",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          _buildMainLoanBanner(context),
          const SizedBox(height: 30),

          // ---------------- ACTIVE LOANS ----------------
          const ActiveLoansWidget(),

          const SizedBox(height: 30),

          // ---------------- PROMO CARD ----------------
          _promoCard(),
          const SizedBox(height: 100), // to prevent bottom nav overlap
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  // ---------------- HEADER ----------------
  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _menuIcon(context),
            IconButton(
              icon: const Icon(Icons.notifications, color: Color(0xFF3DA48D), size: 24),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          "Хялбар, хурдан,",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Text(
          "найдвартай зээл",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 20),
        _searchBox(),
      ],
    );
  }

  Widget _menuIcon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const InfoPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 28, height: 2, color: const Color(0xFF085544)),
            const SizedBox(height: 6),
            Container(width: 20, height: 2, color: const Color(0xFF085544)),
          ],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFAFBFB),
        border: Border.all(color: const Color(0xFFB4B4B6)),
      ),
      child: Row(
        children: const [
          SizedBox(width: 12),
          Icon(Icons.search, size: 26, color: Colors.grey),
          SizedBox(width: 10),
          Text("Хайх...", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // ---------------- MAIN LOAN BANNER ----------------
  Widget _buildMainLoanBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF085544),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Та манай үйлчилгээг авахын тулд үйлчилгээний нөхцөлтэй танилцаж\nонлайн гэрээ байгуулах шаардлагатай",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Онлайн гэрээ байгуулах",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HuseltPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6D31),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- PROMO CARD ----------------
  Widget _promoCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFBFB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              "assets/images/iphone.png",
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "iPhone 16",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "iPhone 16 Pro Max нь хамгийн том iPhone дэлгэцтэй болж, 6.9 инчийн Super Retina XDR...",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- BOTTOM NAVIGATION ----------------
class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF3F2),
        borderRadius: BorderRadius.circular(42),
        boxShadow: const [BoxShadow(color: Color(0x3F000000), blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Color(0xFF3DA48D), size: 23),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.grid_view, color: Color(0xFF3DA48D), size: 23),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
          ),
          Container(
            width: 60,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: const Center(
              child: Text(
                'Бусад',
                style: TextStyle(color: Color(0xFF3DA48D), fontSize: 12, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFF3DA48D), size: 23),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
