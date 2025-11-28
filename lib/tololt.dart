import 'package:flutter/material.dart';

class TololtPage extends StatefulWidget {
  const TololtPage({super.key});

  @override
  State<TololtPage> createState() => _TololtPageState();
}

class _TololtPageState extends State<TololtPage> {
  bool _isQPaySelected = false;

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
          'Tololt',
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

              // Payment Options
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
                  _buildPaymentOptionButton('Шууд төлөх', true),
                  const SizedBox(width: 12),
                  _buildPaymentOptionButton('Дансаар төлөх', false),
                ],
              ),
              const SizedBox(height: 20),

              // Payment Method Selection
              Row(
                children: [
                  Checkbox(
                    value: _isQPaySelected,
                    onChanged: (bool? value) {
                      setState(() {
                        _isQPaySelected = value ?? false;
                      });
                    },
                    activeColor: const Color(0xFF3DA48D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const Text(
                    'QPay',
                    style: TextStyle(
                      color: Color(0xFF085544),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/qr_code.png', // Replace with your QR code asset
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOptionButton(String text, bool isSelected) {
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
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

