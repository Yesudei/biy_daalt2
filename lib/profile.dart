import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFBFB),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF085544), size: 24),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Color(0xFF3DA48D), size: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ProfileHeader(),
              SizedBox(height: 20),
              ProfileMenuItem(
                icon: Icons.person,
                title: 'Хувийн мэдээлэл',
                subtitle: 'Хувийн мэдээлэл, гэрийн хаяг',
              ),
              SizedBox(height: 12),
              ProfileMenuItem(
                icon: Icons.phone,
                title: 'Холбогдох хүний мэдээлэл',
                subtitle: 'Яаралтай үед холбогдох хүний дугаар',
              ),
              SizedBox(height: 12),
              ProfileMenuItem(
                icon: Icons.settings,
                title: 'Нэвтрэх тохиргоо',
                subtitle: 'Яаралтай үед холбогдох хүний дугаар',
              ),
              SizedBox(height: 12),
              ProfileMenuItem(
                icon: Icons.account_balance,
                title: 'Банкны данс',
                subtitle: 'Яаралтай үед холбогдох хүний дугаар',
              ),
              SizedBox(height: 40),
              BottomNavigation(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/avatar.png'), // Replace with your image
        ),
        SizedBox(height: 12),
        Text(
          'Овог, Нэр',
          style: TextStyle(
            color: Color(0xFF6E7074),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Ө.СҮХ-ОЧИР',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 66,
            height: 76,
            decoration: const BoxDecoration(
              color: Color(0x193DA48D),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
            child: Center(
              child: Icon(icon, color: const Color(0xFF3DA48D), size: 24),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF6E7074),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.arrow_forward_ios, color: Color(0xFF6E7074), size: 16),
          ),
        ],
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      decoration: BoxDecoration(
        color: const Color(0xFFEFF3F2),
        borderRadius: BorderRadius.circular(42),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 53,
            top: 29,
            child: Icon(Icons.home, color: Color(0xFF3DA48D), size: 23),
          ),
          const Positioned(
            left: 120,
            top: 31,
            child: Icon(Icons.grid_view, color: Color(0xFF3DA48D), size: 23),
          ),
          Positioned(
            left: 188,
            top: 5,
            child: Container(
              width: 187,
              height: 74,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(37),
                  topRight: Radius.circular(37),
                  bottomLeft: Radius.circular(37),
                  bottomRight: Radius.circular(37),
                ),
              ),
              child: const Center(
                child: Text(
                  'Бусад',
                  style: TextStyle(
                    color: Color(0xFF3DA48D),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            right: 53,
            top: 29,
            child: Icon(Icons.settings, color: Color(0xFF3DA48D), size: 23),
          ),
        ],
      ),
    );
  }
}
