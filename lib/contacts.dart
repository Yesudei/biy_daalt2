import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F9F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF085544), size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Contacts',
          style: TextStyle(
            color: Color(0xFF085544),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Column(
        children: [
          // ================== TOP IMAGE ==================
          SizedBox(
            width: double.infinity,
            height: 233,
            child: Image.asset(
              "assets/images/img_3.png",
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),


          // ================== LIST ==================
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: const [
                ContactCard(
                  name: 'Холбогдох хүн - 2',
                  lastName: 'Хэн ч биш',
                  firstName: 'Хүнбиш',
                  relationship: 'Тэрсөн ах',
                  phone: '8815 5230',
                ),
                SizedBox(height: 12),
                ContactCard(
                  name: 'Холбогдох хүн - 2',
                  lastName: 'Хэн ч биш',
                  firstName: 'Хүнбиш',
                  relationship: 'Тэрсөн ах',
                  phone: '8815 5230',
                ),
                SizedBox(height: 20),
              ],
            ),
          ),

          // ================== ADD BUTTON ==================
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF3DA48D),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xFF3DA48D)),
                ),
              ),
              onPressed: () {
                // Add contact logic
              },
              icon: const Icon(Icons.add, color: Color(0xFF3DA48D)),
              label: const Text(
                'Нэмэх',
                style: TextStyle(
                  color: Color(0xFF3DA48D),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================== CONTACT CARD ==================

class ContactCard extends StatelessWidget {
  final String name;
  final String lastName;
  final String firstName;
  final String relationship;
  final String phone;

  const ContactCard({
    super.key,
    required this.name,
    required this.lastName,
    required this.firstName,
    required this.relationship,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + Delete
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Color(0xFF085544),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF3DA48D).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.delete,
                  color: Color(0xFF3DA48D),
                  size: 18,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          _buildInfoRow('Овог', lastName),
          const SizedBox(height: 8),
          _buildInfoRow('Нэр', firstName),
          const SizedBox(height: 8),
          _buildInfoRow('Хамаарал', relationship),
          const SizedBox(height: 8),
          _buildInfoRow('Утасны дугаар', phone),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF6E7074),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Color(0xFF085544),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
