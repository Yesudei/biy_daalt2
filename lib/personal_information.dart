import 'package:flutter/material.dart';
import 'change_number.dart'; // import ChangeNumberPage

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

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
          'Personal Information',
          style: TextStyle(
            color: Color(0xFF085544),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ⭐ TOP IMAGE LIKE FIGMA ⭐
              SizedBox(
                width: 428,
                height: 233,
                child: Image.asset(
                  'assets/images/img_3.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Personal Info Card
              InfoCard(
                title: 'Өөрийн мэдээлэл',
                fields: {
                  'Ургийн овог': 'Боржигон',
                  'Овог нэр': 'Ө.СҮХ-ОЧИР',
                  'Регистрийн дугаар': 'ХК 860802 21',
                  'Хүйс': 'Эрэгтэй',
                  // Phone will be handled separately with edit icon
                },
                phoneNumber: '8815 5230',
                onEditPhone: () {
                  // Navigate to ChangeNumberPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChangeNumberPage()),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Address Card
              const InfoCard(
                title: 'Оршин суугаа нэмэлт хаяг',
                fields: {
                  'Улс хот': 'Монгол улс, Улаанбаатар хот',
                  'Дүүрэг': 'Сүхбаатар дүүрэг',
                  'Хороо': '12-р хороо',
                  'Байр гудамж': '16-р байр',
                  'Хаалганы тоот': '88',
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final Map<String, String> fields;
  final String? phoneNumber;
  final VoidCallback? onEditPhone;

  const InfoCard({
    super.key,
    required this.title,
    required this.fields,
    this.phoneNumber,
    this.onEditPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF085544),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ...fields.entries.map(
                (entry) => _buildInfoRow(entry.key, entry.value),
          ),
          if (phoneNumber != null && onEditPhone != null) ...[
            const SizedBox(height: 8),
            _buildPhoneRow('Утасны дугаар', phoneNumber!, onEditPhone!),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
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
      ),
    );
  }

  Widget _buildPhoneRow(String label, String value, VoidCallback onEdit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
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
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit, color: Color(0xFF3DA48D)),
          ),
        ],
      ),
    );
  }
}
