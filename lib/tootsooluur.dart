import 'package:flutter/material.dart';

class TootsooluurPage extends StatefulWidget {
  final double loanAmount;
  final int loanTerm;
  final int paymentDay;

  const TootsooluurPage({
    super.key,
    required this.loanAmount,
    required this.loanTerm,
    required this.paymentDay,
  });

  @override
  State<TootsooluurPage> createState() => _TootsooluurPageState();
}

class _TootsooluurPageState extends State<TootsooluurPage> {
  bool _isTermsAccepted = false;
  late double interestRate;
  late double totalInterest;
  late double totalPayment;
  late double monthlyPayment;
  late List<Map<String, dynamic>> schedule;

  @override
  void initState() {
    super.initState();
    interestRate = 0.12;
    _calculateLoan();
  }

  void _calculateLoan() {
    double principal = widget.loanAmount;
    int n = widget.loanTerm;
    totalInterest = principal * interestRate * (n / 12);
    totalPayment = principal + totalInterest;
    monthlyPayment = totalPayment / n;

    schedule = List.generate(n, (index) {
      double principalPayment = principal / n;
      double interestPayment = totalInterest / n;
      double balance = principal - principalPayment * index;
      return {
        'month': index + 1,
        'date': '2025.${widget.paymentDay.toString().padLeft(2, '0')}.${index + 1}',
        'balance': balance.toStringAsFixed(0),
        'principal': principalPayment.toStringAsFixed(0),
        'interest': interestPayment.toStringAsFixed(0),
        'total': (principalPayment + interestPayment).toStringAsFixed(0),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFBFB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Зээлийн тооцоолол ба эргэн төлөлтийн график',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF085544),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildSummaryRow('Зээлийн хэмжээ', '${widget.loanAmount.toStringAsFixed(0)} ₮'),
                    _buildSummaryRow('Зээлийн хүү', '${(interestRate * 100).toStringAsFixed(0)}%'),
                    _buildSummaryRow('Хүүгийн төлбөр', '${totalInterest.toStringAsFixed(0)} ₮'),
                    _buildSummaryRow('Зээлийн нийт төлбөр', '${totalPayment.toStringAsFixed(0)} ₮'),
                    _buildSummaryRow('Сар бүрийн төлбөр', '${monthlyPayment.toStringAsFixed(0)} ₮'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Төлөлтийн график', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Column(children: schedule.map((item) => _buildScheduleItem(item)).toList()),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _isTermsAccepted,
                    onChanged: (val) => setState(() => _isTermsAccepted = val ?? false),
                    shape: const CircleBorder(),
                    activeColor: const Color(0xFFFF6D31),
                  ),
                  const Text('Нөхцөлийг хүлээн зөвшөөрч байна',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isTermsAccepted ? const Color(0xFFFF6D31) : Colors.grey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  onPressed: _isTermsAccepted
                      ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Зээлийн хүсэлт амжилттай илгээгдлээ')),
                    );
                  }
                      : null,
                  child: const Text('Зээл авах',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildScheduleItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFB4B4B6)),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF3DA48D),
              borderRadius: BorderRadius.vertical(top: Radius.circular(2)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${item['month']}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('${item['date']}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildScheduleRow('Зээлийн үлдэгдэл', item['balance']),
                _buildScheduleRow('Үндсэн зээлийн төлбөр', item['principal']),
                _buildScheduleRow('Бодогдсон хүү', item['interest']),
                const Divider(color: Color(0xFFB4B4B6)),
                _buildScheduleRow('Нийт төлбөр', item['total'], isBold: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: isBold ? Colors.black : const Color(0xFF6E7074), fontWeight: isBold ? FontWeight.bold : FontWeight.w600)),
          Text(value, style: TextStyle(color: isBold ? Colors.black : const Color(0xFF6E7074), fontWeight: isBold ? FontWeight.bold : FontWeight.w600)),
        ],
      ),
    );
  }
}
