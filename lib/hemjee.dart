import 'package:flutter/material.dart';

class HemjeePage extends StatefulWidget {
  const HemjeePage({super.key});

  @override
  State<HemjeePage> createState() => _HemjeePageState();
}

class _HemjeePageState extends State<HemjeePage> {
  double loanAmount = 1000000;
  int loanTerm = 14;
  final List<int> termOptions = List.generate(30, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.arrow_back, size: 24),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 20),
              const Text(
                'Богино хэмжээний зээлийн\nхүсэлт гаргах',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Та хэр их зээл авахыг хүсч байна вэ?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Text(
                'хэр удаан? Зээлийн жилийн хүү 12%',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              const Text(
                'Хүсэж буй зээлийн хэмжээ | ₮',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFB4B4B6)),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Text(
                      '${loanAmount.toInt().toString().replaceAllMapped(
                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]},',
                      )}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '₮',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 5,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
                  activeTrackColor: const Color(0xFF3DA48D),
                  inactiveTrackColor: const Color(0xFFB4B4B6),
                ),
                child: Slider(
                  value: loanAmount,
                  min: 50000,
                  max: 2000000,
                  onChanged: (value) {
                    setState(() {
                      loanAmount = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '50,000₮',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF6E7074),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '2,000,000₮',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF6E7074),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFB4B4B6)),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Зээлийн хугацаа',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6E7074),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    DropdownButton<int>(
                      value: loanTerm,
                      items: termOptions.map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(
                            '$value',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (int? newValue) {
                        if (newValue != null) {
                          setState(() {
                            loanTerm = newValue;
                          });
                        }
                      },
                    ),
                    const Text(
                      'Хоног',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6E7074),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6E7074),
                      fontFamily: 'Inter',
                      height: 1.57,
                    ),
                    children: [
                      const TextSpan(text: 'Та '),
                      TextSpan(
                        text: '${loanAmount.toInt().toString().replaceAllMapped(
                          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (Match m) => '${m[1]},',
                        )}₮',
                        style: const TextStyle(
                          color: Color(0xFF3DA48D),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: ' хэмжээний төгрөгийн зээлийг жилийн '),
                      const TextSpan(
                        text: '12%',
                        style: TextStyle(
                          color: Color(0xFF3DA48D),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: '-ийн хүүтэйгээр '),
                      TextSpan(
                        text: '$loanTerm',
                        style: const TextStyle(
                          color: Color(0xFF3DA48D),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: ' сарын хугацаанд зээлэхэд эхний сард '),
                      const TextSpan(
                        text: '307,604',
                        style: TextStyle(
                          color: Color(0xFF3DA48D),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: ' төгрөг төлж, сар бүр төлөх хэмжээ буурна.'),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3DA48D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Implement calculation logic
                  },
                  child: const Text(
                    'Тооцоолох',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
