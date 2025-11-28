import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tootsooluur.dart';
import 'profile.dart';
import 'home_page.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F8),
      body: Stack(
        children: [
          Column(
            children: [
              // Header with logo
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: const Color(0xFFF5F9F8),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo1.png',
                    height: 60,
                  ),
                ),
              ),
              // Contact options list
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  children: [
                    _buildContactItem(
                      context,
                      icon: Icons.location_on,
                      title: 'Салбарын байршил',
                      onTap: () {
                        // TODO: Open map or location
                      },
                    ),
                    _buildContactItem(
                      context,
                      icon: Icons.phone,
                      title: 'Операторотой холбогдох',
                      onTap: () async {
                        const phoneNumber = 'tel:+97612345678';
                        if (await canLaunch(phoneNumber)) {
                          await launch(phoneNumber);
                        }
                      },
                    ),
                    _buildContactItem(
                      context,
                      icon: Icons.facebook,
                      title: 'Facebook холбох',
                      onTap: () async {
                        const facebookUrl = 'https://facebook.com/mongolianinvestment';
                        if (await canLaunch(facebookUrl)) {
                          await launch(facebookUrl);
                        }
                      },
                    ),
                    _buildContactItem(
                      context,
                      icon: Icons.email,
                      title: 'Имэйл холбох',
                      onTap: () async {
                        const email = 'mailto:info@mis.mn';
                        if (await canLaunch(email)) {
                          await launch(email);
                        }
                      },
                    ),
                    _buildContactItem(
                      context,
                      icon: Icons.add,
                      title: 'Зээлийн тооцоолуур',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TootsooluurPage(
                              loanAmount: 4000000,
                              loanTerm: 14,
                              paymentDay: 15,
                            ),
                          ),
                        );
                      },
                    ),
                    _buildContactItem(
                      context,
                      icon: Icons.help,
                      title: 'Үйлчилгээний нөхцөл',
                      onTap: () {},
                    ),
                    _buildContactItem(
                      context,
                      icon: Icons.privacy_tip,
                      title: 'Найзаа урих',
                      onTap: () {},
                    ),
                    _buildContactItem(
                      context,
                      icon: Icons.archive,
                      title: 'Зээлийн архив',
                      onTap: () {},
                    ),
                    _buildContactItem(
                      context,
                      icon: Icons.question_answer,
                      title: 'Өр логийн харьцаа',
                      onTap: () {},
                    ),
                    _buildContactItem(
                      context,
                      icon: Icons.security,
                      title: 'Асуулт хариулт',
                      onTap: () {},
                    ),
                    _buildContactItem(
                      context,
                      icon: Icons.system_security_update,
                      title: 'Системээс гарах',
                      onTap: () {},
                    ),
                    const SizedBox(height: 100), // Space for bottom nav
                  ],
                ),
              ),
            ],
          ),
          // Fixed Bottom Navigation
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: const BottomNavigation(),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F9F8),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF085544), size: 24),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          'Info',
          style: TextStyle(
            color: Color(0xFF085544),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Color(0xFF3DA48D), size: 24),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFF3DA48D),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF085544),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFF6E7074),
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }
}

// ---------------- Bottom Navigation ----------------
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
            onPressed: () {},
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
