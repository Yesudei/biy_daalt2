import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 60),

          // ----- Header -----
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF085544), width: 2),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/40x40"),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            "Хялбар, хурдан,",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),

          const Text(
            "найдвартай зээл",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 30),

          // ----- Search Bar -----
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFFAFBFB),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0xFFB4B4B6)),
            ),
            child: Row(
              children: [
                const SizedBox(width: 15),
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 10),
                const Text("Хайх...", style: TextStyle(color: Colors.grey)),
                const Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/40x40"),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // ----- Loan product card -----
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF085544),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Онлайн гэрээ байгуулах",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Та манай үйлчилгээг авахын тулд\nүйлчилгээний нөхцөлтэй танилцаж\nонлайн гэрээ байгуулах шаардлагатай",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ----- Continue Button -----
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3DA48D),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: const Text(
              "Үргэлжүүлэх",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 40),

          // ----- Sample product -----
          Container(
            height: 260,
            decoration: BoxDecoration(
              color: const Color(0xFFFAFBFB),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/368x287"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "iPhone 16",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "iPhone 16 Pro Max нь хамгийн том iPhone",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
