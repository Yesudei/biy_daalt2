import 'package:flutter/material.dart';

class TololtPage extends StatefulWidget {
  final String? paymentType;

  const TololtPage({super.key, this.paymentType});

  @override
  State<TololtPage> createState() => _TololtPageState();
}

class _TololtPageState extends State<TololtPage> {
  bool _isQPaySelected = false;
  int selectedPayBtn = 0; // 0 = Шууд төлөх | 1 = Дансаар төлөх

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F9F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF085544)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Зээл төлөлт",
          style: TextStyle(
            color: Color(0xFF085544),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const LoanInfoCard(),

            const SizedBox(height: 25),
            const Text(
              "Төлөлтийн төрөл",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xFF085544),
              ),
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                _paymentTab("Шууд төлөх", 0),
                const SizedBox(width: 12),
                _paymentTab("Дансаар төлөх", 1),
              ],
            ),

            const SizedBox(height: 30),

            // ---------------- SHOW CONTENT BASED ON SELECTION ----------------
            if (selectedPayBtn == 0) _buildQPaySection(),
            if (selectedPayBtn == 1) _buildBankTransferSection(),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  // ================= PAYMENT SELECTION BUTTON =================
  Widget _paymentTab(String text, int index) {
    bool selected = selectedPayBtn == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedPayBtn = index),
        child: Container(
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF0E7E5A) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: selected ? const Color(0xFF0E7E5A) : const Color(0xFFC7C7C7),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFF085544),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  // ================== QPAY SECTION ==================
  Widget _buildQPaySection() {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: _isQPaySelected,
              activeColor: const Color(0xFF0E7E5A),
              onChanged: (v) => setState(() => _isQPaySelected = v ?? false),
            ),
            const Text(
              "QPay",
              style: TextStyle(fontSize: 16, color: Color(0xFF085544)),
            ),
            const Spacer(),
            Image.asset("assets/images/img_2.png", width: 120, height: 120),
          ],
        ),
        const SizedBox(height: 15),
        if (_isQPaySelected)
          Column(
            children: [
              Image.asset("assets/images/qpay.png", width: 180),
              const SizedBox(height: 10),
              const Text("QR кодыг уншуулж төлнө үү."),
            ],
          ),
      ],
    );
  }

  // ================== BANK TRANSFER SECTION ==================
  Widget _buildBankTransferSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bankRow("Банк", "Хаан Банк"),
        const SizedBox(height: 12),
        _bankRow("Дансны дугаар", "5170512345"),
        const SizedBox(height: 12),
        _bankRow("Дансны нэр", "YUCH BISH LLC"),
        const SizedBox(height: 12),
        _bankRow("Гүйлгээний утга", "SDJSD4585132"),
        const SizedBox(height: 20),

        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF085544),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Төлсөн",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bankRow(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF085544),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.copy, size: 20),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}


// ====================== LOAN INFO CARD ======================
class LoanInfoCard extends StatelessWidget {
  const LoanInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFF085544),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                "ДИЖИТАЛ ЗЭЭЛ",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
            const Text("SDJSD4585132", style: TextStyle(color: Colors.grey)),
          ]),

          const SizedBox(height: 18),
          const Text("2025.11.28", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          const Text("өдрийн төлөх дүн", style: TextStyle(color: Color(0xFF0E7E5A))),
          const SizedBox(height: 10),

          const Text("465,000₮",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800)),

          const Divider(height: 30),

          _row("Үндсэн зээл", "410,000₮"),
          _row("Хүүгийн төлбөр | 32 хоног", "50,000₮"),
          _row("Нэмэгдүүлсэн хүү | 2 хоног", "5,000₮"),
        ],
      ),
    );
  }

  Widget _row(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 15)),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF085544),
            ),
          ),
        ],
      ),
    );
  }
}
