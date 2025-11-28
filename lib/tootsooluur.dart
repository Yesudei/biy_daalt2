import 'package:flutter/material.dart';

class TootsooluurPage extends StatelessWidget {
  const TootsooluurPage({super.key});

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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleSection(),
              LoanSummaryCard(),
              SizedBox(height: 20),
              RepaymentSchedule(),
              SizedBox(height: 20),
              TermsCheckbox(),
              SizedBox(height: 20),
              TakeLoanButton(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Зээлийн тооцоолол ба эргэн',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          'төлөлтийн график',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class LoanSummaryCard extends StatelessWidget {
  const LoanSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF085544),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          Text(
            'Зээлийн тооцоолол',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          LoanSummaryRow(label: 'Зээлийн хүү', value: '12%'),
          LoanSummaryRow(label: 'Хүүгийн төлбөр', value: '306,466 ₮'),
          LoanSummaryRow(label: 'Зээлийн нийт төлбөр', value: '4,306,466 ₮'),
          LoanSummaryRow(label: 'Сар бүрийн төлбөр', value: '307,605 ₮'),
        ],
      ),
    );
  }
}

class LoanSummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const LoanSummaryRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFE7E8EC),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class RepaymentSchedule extends StatelessWidget {
  const RepaymentSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for repayment schedule
    final List<Map<String, String>> schedule = [
      {
        'date': '2022.05.15',
        'balance': '3,732,395₮',
        'principal': '267,604₮',
        'interest': '40,000₮',
        'total': '307,604₮',
      },
      {
        'date': '2022.05.15',
        'balance': '3,732,395₮',
        'principal': '267,604₮',
        'interest': '40,000₮',
        'total': '307,604₮',
      },
      {
        'date': '2022.05.15',
        'balance': '3,732,395₮',
        'principal': '267,604₮',
        'interest': '40,000₮',
        'total': '307,604₮',
      },
      {
        'date': '2022.05.15',
        'balance': '3,732,395₮',
        'principal': '267,604₮',
        'interest': '40,000₮',
        'total': '307,604₮',
      },
      {
        'date': '2022.05.15',
        'balance': '3,732,395₮',
        'principal': '267,604₮',
        'interest': '40,000₮',
        'total': '307,604₮',
      },
    ];

    return Column(
      children: schedule.asMap().entries.map((entry) {
        int index = entry.key;
        var item = entry.value;
        return RepaymentScheduleItem(
          index: index + 1,
          date: item['date']!,
          balance: item['balance']!,
          principal: item['principal']!,
          interest: item['interest']!,
          total: item['total']!,
        );
      }).toList(),
    );
  }
}

class RepaymentScheduleItem extends StatelessWidget {
  final int index;
  final String date;
  final String balance;
  final String principal;
  final String interest;
  final String total;

  const RepaymentScheduleItem({
    super.key,
    required this.index,
    required this.date,
    required this.balance,
    required this.principal,
    required this.interest,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
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
                Text(
                  '$index',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildRow('Зээлийн үлдэгдэл', balance),
                _buildRow('Үндсэн зээлийн төлбөр', principal),
                _buildRow('Бодогдсон хүү', interest),
                const Divider(color: Color(0xFFB4B4B6)),
                _buildRow('Нийт төлбөр', total, isBold: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isBold ? Colors.black : const Color(0xFF6E7074),
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isBold ? Colors.black : const Color(0xFF6E7074),
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class TermsCheckbox extends StatelessWidget {
  const TermsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (bool? value) {},
          shape: const CircleBorder(),
        ),
        const Text(
          'Нөхцөлийг хүлээн зөвшөөрч байна',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6E7074),
          ),
        ),
      ],
    );
  }
}

class TakeLoanButton extends StatelessWidget {
  const TakeLoanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6D31),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: () {},
        child: const Text(
          'Зээл авах',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}