import 'package:flutter/material.dart';
import 'tololt.dart'; // <-- import TololtPage

class ZeelInfoPage extends StatefulWidget {
  final String title;
  final String date;
  final String amount;

  const ZeelInfoPage({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
  });

  @override
  State<ZeelInfoPage> createState() => _ZeelInfoPageState();
}

class _ZeelInfoPageState extends State<ZeelInfoPage> {
  String _selectedPaymentType = '';

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
        title: Text(
          widget.title,
          style: const TextStyle(
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
              const Text(
                'Зээлийн дэлгэрэнгүй',
                style: TextStyle(
                  color: Color(0xFF085544),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),

              // Loan Info Card
              LoanInfoCard(
                title: widget.title,
                date: widget.date,
                amount: widget.amount,
              ),
              const SizedBox(height: 20),

              // Info Text
              const Text(
                'Хэрэглэгч та доорх хэлбэрээс хийхийг хүссэн цонхыг сонгож цааш үргэлжлүүлнэ үү.',
                style: TextStyle(
                  color: Color(0xFF6E7074),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),

              // Payment Type Selection
              const Text(
                'Төлөлтийн төрөл',
                style: TextStyle(
                  color: Color(0xFF085544),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildPaymentTypeChip('Төлөх', 'payment'),
                  const SizedBox(width: 12),
                  _buildPaymentTypeChip('Сунгах', 'refinance'),
                  const SizedBox(width: 12),
                  _buildPaymentTypeChip('Хаах', 'close'),
                ],
              ),
              const SizedBox(height: 30),

              // Action Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6D31),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _selectedPaymentType.isNotEmpty
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TololtPage(
                          paymentType: _selectedPaymentType,
                        ),
                      ),
                    );
                  }
                      : null,
                  child: const Text(
                    'Зээл үргэлжлүүлэн төлөх',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Navigation Cards
              const NavigationCard(
                icon: Icons.bar_chart,
                title: 'Зээлийн график',
              ),
              const SizedBox(height: 12),
              const NavigationCard(
                icon: Icons.description,
                title: 'Гүйлгээний түүх',
              ),
              const SizedBox(height: 12),
              const NavigationCard(
                icon: Icons.credit_score,
                title: 'Барьцаа хөрөнгө',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentTypeChip(String label, String value) {
    return ChoiceChip(
      label: Text(label),
      selected: _selectedPaymentType == value,
      onSelected: (bool selected) {
        setState(() {
          _selectedPaymentType = selected ? value : '';
        });
      },
      selectedColor: const Color(0xFF3DA48D),
      labelStyle: TextStyle(
        color: _selectedPaymentType == value ? Colors.white : const Color(0xFF6E7074),
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: _selectedPaymentType == value
              ? const Color(0xFF3DA48D)
              : const Color(0xFFB4B4B6),
        ),
      ),
    );
  }
}

class LoanInfoCard extends StatelessWidget {
  final String title;
  final String date;
  final String amount;

  const LoanInfoCard({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
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
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.toUpperCase(),
                style: const TextStyle(
                  color: Color(0xFF085544),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5F0),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Хэвийн',
                  style: TextStyle(
                    color: Color(0xFF3DA48D),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFFE0E0E0)),
          const SizedBox(height: 12),
          _buildInfoRow('Олгосон зээл', amount),
          const SizedBox(height: 8),
          _buildInfoRow('Зээлийн хүү', '12%'),
          const SizedBox(height: 8),
          _buildInfoRow('Зээлийн хугацаа', '12 сар'),
          const SizedBox(height: 8),
          _buildInfoRow('Зээлийн үлдэгдэл', '2,800,000 ₮'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF6E7074),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF085544),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class NavigationCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const NavigationCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
        onTap: () {
          // TODO: Navigate to respective page
        },
      ),
    );
  }
}
