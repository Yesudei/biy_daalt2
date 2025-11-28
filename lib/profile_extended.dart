import 'package:flutter/material.dart';

class ExtendedProfilePage extends StatefulWidget {
  const ExtendedProfilePage({super.key});

  @override
  State<ExtendedProfilePage> createState() => _ExtendedProfilePageState();
}

class _ExtendedProfilePageState extends State<ExtendedProfilePage> {
  bool _isLoginSettingsExpanded = false;
  bool _isBankAccountsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFBFB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF085544), size: 24),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Color(0xFF3DA48D), size: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const ProfileHeader(),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Icons.person,
                title: 'Хувийн мэдээлэл',
                subtitle: 'Хувийн мэдээлэл, гэрийн хаяг',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              ProfileMenuItem(
                icon: Icons.phone,
                title: 'Холбогдох хүний мэдээлэл',
                subtitle: 'Яаралтай үед холбогдох хүний дугаар',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              ExpandableMenuItem(
                icon: Icons.settings,
                title: 'Нэвтрэх тохиргоо',
                subtitle: 'Яаралтай үед холбогдох хүний дугаар',
                isExpanded: _isLoginSettingsExpanded,
                onTap: () {
                  setState(() {
                    _isLoginSettingsExpanded = !_isLoginSettingsExpanded;
                  });
                },
                children: _isLoginSettingsExpanded
                    ? [
                  const SubMenuItem(
                    icon: Icons.lock,
                    title: 'Нэвтрэх нууц үг солих',
                  ),
                  const SubMenuItem(
                    icon: Icons.email,
                    title: 'Гүйлгээний нууц үг солих',
                  ),
                  const SubMenuItem(
                    icon: Icons.mail,
                    title: 'И-мэйл хаяг солих',
                  ),
                ]
                    : null,
              ),
              const SizedBox(height: 12),
              ExpandableMenuItem(
                icon: Icons.account_balance,
                title: 'Банкны данс',
                subtitle: 'Яаралтай үед холбогдох хүний дугаар',
                isExpanded: _isBankAccountsExpanded,
                onTap: () {
                  setState(() {
                    _isBankAccountsExpanded = !_isBankAccountsExpanded;
                  });
                },
                children: null, // Add your bank account items here
              ),
              const SizedBox(height: 40),
              const BottomNavigation(),
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
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}

class ExpandableMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isExpanded;
  final VoidCallback onTap;
  final List<Widget>? children;

  const ExpandableMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isExpanded,
    required this.onTap,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    isExpanded ? Icons.expand_less : Icons.arrow_forward_ios,
                    color: const Color(0xFF6E7074),
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded && children != null) ...children,
      ],
    );
  }
}

class SubMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const SubMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(top: 8, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Icon(icon, color: const Color(0xFF3DA48D), size: 20),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
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
