import 'package:flutter/material.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Navigate to HomePage if form is valid
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFB),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 120),
              const Text(
                "Зээлийн ухаалаг",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                "сонголт энд",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                "Таны санхүүгийн эрх чөлөөг дэмжих, амжилттай хэрэгжүүлсэн зээлээр амьдралдаа шинэ шат ахиулах боломжийг олгоно.",
                style: TextStyle(fontSize: 14, color: Color(0xFF6E7074)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Phone Number
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Утасны дугаар',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: Color(0xFF6E7074)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Утасны дугаар оруулна уу';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Нууц үг',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: Color(0xFF6E7074)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Нууц үг оруулна уу';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 40),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6D31),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: _login,
                  child: const Text(
                    "Нэвтрэх",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Нууц үгээ мартсан уу?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/faceid.png",
                    width: 26,
                    height: 26,
                  ),
                  const SizedBox(width: 40), // space between icons
                  Image.asset(
                    "assets/images/fingerprint.png",
                    width: 26,
                    height: 26,
                  ),
                ],
              ),
              const SizedBox(width: 60),
              Row(
                children: const [
                  Expanded(child: Divider(color: Color(0x996E7074))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Эсвэл",
                      style: TextStyle(color: Color(0x996E7074), fontSize: 16),
                    ),
                  ),
                  Expanded(child: Divider(color: Color(0x996E7074))),
                ],
              ),

              const SizedBox(height: 20),

              const SizedBox(height: 40),

              // Register Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF085544),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    // Add your register navigation here
                  },
                  child: const Text(
                    "Шинэ хэрэглэгч? - Бүртгүүлэх",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
