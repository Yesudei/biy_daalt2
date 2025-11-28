import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F8),
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
      body: Column(
        children: [
          // Header with logo
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: const Color(0xFFF5F9F8),
            child: Center(
              child: Image.asset(
                'assets/logo.png', // Replace with your logo asset
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
                    // TODO: Navigate to loan calculator
                  },
                ),
                _buildContactItem(
                  context,
                  icon: Icons.help,
                  title: 'Үйлчилгээний нөхцөл',
                  onTap: () {
                    // TODO: Navigate to terms of service
                  },
                ),
                _buildContactItem(
                  context,
                  icon: Icons.privacy_tip,
                  title: 'Найзаа урих',
                  onTap: () {
                    // TODO: Navigate to referral page
                  },
                ),
                _buildContactItem(
                  context,
                  icon: Icons.archive,
                  title: 'Зээлийн архив',
                  onTap: () {
                    // TODO: Navigate to loan archive
                  },
                ),
                _buildContactItem(
                  context,
                  icon: Icons.question_answer,
                  title: 'Өр логийн харьцаа',
                  onTap: () {
                    // TODO: Navigate to exchange rates
                  },
                ),
                _buildContactItem(
                  context,
                  icon: Icons.security,
                  title: 'Асуулт хариулт',
                  onTap: () {
                    // TODO: Navigate to FAQ
                  },
                ),
                _buildContactItem(
                  context,
                  icon: Icons.system_security_update,
                  title: 'Системээс гарах',
                  onTap: () {
                    // TODO: Log out user
                  },
                ),
              ],
            ),
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