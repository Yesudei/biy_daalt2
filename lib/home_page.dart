import 'package:flutter/material.dart';
import 'huselt.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(),
          const SizedBox(height: 20),

          // Зээлийн бүтээгдэхүүн
          const Text(
            "Зээлийн бүтээгдэхүүн",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),

          _buildMainLoanBanner(context),

          const SizedBox(height: 30),

          // Идэвхтэй зээл
          const Text(
            "Таны идэвхитэй зээлүүд",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          _activeLoanCard(),

          const SizedBox(height: 30),

          // Promo
          _promoCard(),
        ],
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _menuIcon(),
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage("https://placehold.co/40x40"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          "Хялбар, хурдан,",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Text(
          "найдвартай зээл",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 20),
        _searchBox(),
      ],
    );
  }

  Widget _menuIcon() {
    return Column(
      children: [
        Container(
          width: 28,
          height: 2,
          color: const Color(0xFF085544),
        ),
        const SizedBox(height: 6),
        Container(
          width: 20,
          height: 2,
          color: const Color(0xFF085544),
        ),
      ],
    );
  }

  Widget _searchBox() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFAFBFB),
        border: Border.all(color: Color(0xFFB4B4B6)),
      ),
      child: Row(
        children: const [
          SizedBox(width: 12),
          Icon(Icons.search, size: 26, color: Colors.grey),
          SizedBox(width: 10),
          Text("Хайх...", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // ---------------- MAIN LOAN BANNER ----------------
  Widget _buildMainLoanBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF085544),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Та манай үйлчилгээг авахын тулд үйлчилгээний нөхцөлтэй танилцаж\nонлайн гэрээ байгуулах шаардлагатай",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Онлайн гэрээ байгуулах",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HuseltPage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6D31),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- ACTIVE LOAN CARD ----------------
  Widget _activeLoanCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF3F2),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: const [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage("https://placehold.co/100x100"),
          ),
          SizedBox(width: 20),
          Text(
            "Идэвхтэй зээл — 1\nТөлбөрийн хугацаа: 3 хоног",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  // ---------------- PROMO CARD ----------------
  Widget _promoCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFBFB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              "https://placehold.co/368x287",
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "iPhone 16",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 8),
                Text(
                  "iPhone 16 Pro Max нь хамгийн том iPhone дэлгэцтэй болж, 6.9 инчийн Super Retina XDR...",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
