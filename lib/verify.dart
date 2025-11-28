import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyNumberPage extends StatefulWidget {
  final String phoneNumber;

  const VerifyNumberPage({super.key, required this.phoneNumber});

  @override
  State<VerifyNumberPage> createState() => _VerifyNumberPageState();
}

class _VerifyNumberPageState extends State<VerifyNumberPage> {
  final List<TextEditingController> _otpControllers =
  List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _otpFocusNodes = List.generate(6, (index) => FocusNode());
  int _secondsRemaining = 59;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _otpFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
        _startTimer();
      }
    });
  }

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
          'Verify Number',
          style: TextStyle(
            color: Color(0xFF085544),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 428,
              height: 233,
              child: Image.asset(
                'assets/images/img_4.png',
                width: 428,
                height: 233,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Баталгаажуулах кодыг илгээсэн дугаар: ${widget.phoneNumber}',
                    style: const TextStyle(
                      color: Color(0xFF085544),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange, width: 1),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline, color: Colors.orange, size: 20),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Баталгаажуулах 6 оронтой кодыг илгээсэн.',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Баталгаажуулах код',
                    style: TextStyle(
                      color: Color(0xFF085544),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 50,
                        child: TextField(
                          controller: _otpControllers[index],
                          focusNode: _otpFocusNodes[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 5) {
                              _otpFocusNodes[index].unfocus();
                              FocusScope.of(context).requestFocus(_otpFocusNodes[index + 1]);
                            } else if (value.isEmpty && index > 0) {
                              _otpFocusNodes[index].unfocus();
                              FocusScope.of(context).requestFocus(_otpFocusNodes[index - 1]);
                            }
                          },
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      '00:${_secondsRemaining.toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        color: Color(0xFF085544),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
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
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: const Text(
                        'Баталгаажуулах',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
