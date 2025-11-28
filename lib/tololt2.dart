import 'package:flutter/material.dart';

class Tololt2Page extends StatefulWidget {
  const Tololt2Page({super.key});

  @override
  State<Tololt2Page> createState() => _Tololt2PageState();
}

class _Tololt2PageState extends State<Tololt2Page> {
  String _selectedPaymentType = 'direct'; // 'direct' or 'account'
  bool _isKhanBankSelected = true;

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
          'Tololt 2',
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
              const Text(
                'Зээл төлөлт',
                style: TextStyle(
                  color: Color(0xFF085544),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),

              // Loan Info Card
              const LoanInfoCard(),
              const SizedBox(height: 20),

              // Payment Type Toggle
              Row(
                children: [
                  _buildPaymentTypeButton('Шууд төлөх', _selectedPaymentType == 'direct'),
                  const SizedBox(width: 12),
                  _buildPaymentTypeButton('Дансаар төлөх', _selectedPaymentType == 'account'),
                ],
              ),
              const SizedBox(height: 20),

              // Bank Selection (only visible when account payment is selected)
              if (_selectedPaymentType == 'account') ...[
                const Text(
                  'Төлөх банкны данс',
                  style: TextStyle(
                    color: Color(0xFF085544),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                _buildBankCard(
                  'assets/khan_bank_logo.png', // Replace with your asset
                  'Хаан банк',
                  '51639000351',
                  'ЮУ Ч БИШ ХХК',
                  '12 сар төлөлт',
                  _isKhanBankSelected,
                  onTap: () {
                    setState(() {
                      _isKhanBankSelected = true;
                    });
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentTypeButton(String text, bool isSelected) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF3DA48D) : Colors.white,
          foregroundColor: isSelected ? Colors.white : const Color(0xFF3DA48D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: isSelected ? const Color(0xFF3DA48D) : const Color(0xFFB4B4B6),
            ),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        onPressed: () {
          setState(() {
            _selectedPaymentType = text == 'Шууд төлөх' ? 'direct' : 'account';
          });
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF3DA48D),
          ),
        ),
      ),
    );
  }

  Widget _buildBankCard(
      String logoPath,
      String bankName,
      String accountNumber,
      String accountOwner,
      String paymentTerm,
      bool isSelected,
      {required VoidCallback onTap}
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xFF3DA48D) : const Color(0xFFE0E0E0),
            width: 1.5,
          ),
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
            Row(
              children: [
                Image.asset(
                  logoPath,
                  width: 32,
                  height: 32,
                ),
                const SizedBox(width: 12),
                Text(
                  bankName,
                  style: const TextStyle(
                    color: Color(0xFF085544),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildBankInfoRow('Дансны дугаар', accountNumber, hasCopy: true),
            const SizedBox(height: 8),
            _buildBankInfoRow('Данс эзэмшигч', accountOwner),
            const SizedBox(height: 8),
            _buildBankInfoRow('Гүйлгээний утга', paymentTerm),
          ],
        ),
      ),
    );
  }

  Widget _buildBankInfoRow(String label, String value, {bool hasCopy = false}) {
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
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF085544),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (hasCopy)
              IconButton(
                icon: const Icon(Icons.copy, size: 16, color: Color(0xFF3DA48D)),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: value));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Дансны дугаар хуулагдлаа')),
                  );
                },
              ),
          ],
        ),
      ],
    );
  }
}

class LoanInfoCard extends StatelessWidget {
  const LoanInfoCard({super.key});

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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF085544),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'ДИЖИТАЛ ЗЭЭЛ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Text(
                'SDJSD4585132',
                style: TextStyle(
                  color: Color(0xFF6E7074),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFE0E0E0)),
          const SizedBox(height: 16),
          _buildPaymentInfoRow('2024.01.01', '465,000₮', 'эдрийн төлөх дүн'),
          const SizedBox(height: 12),
          _buildPaymentInfoRow('Үндсэн зээл', '410,000₮', 'Хүүгийн төлбөр | 32 хоног | 50,000₮\nНэмэгдүүлсэн хүү | 2 хоног | 5,000₮'),
        ],
      ),
    );
  }

  Widget _buildPaymentInfoRow(String leftText, String rightText, String? subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                leftText,
                style: const TextStyle(
                  color: Color(0xFF6E7074),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (subtitle != null) ...[
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
            ],
          ),
        ),
        Text(
          rightText,
          style: const TextStyle(
            color: Color(0xFF085544),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
