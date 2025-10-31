import 'package:flutter/material.dart';
import 'HomeScreen.dart'; // Import tab Home
import 'RekomendasiScreen.dart';// Import tab Rekomendasi
import 'HistoryScreen.dart'; // Import tab Riwayat

// 🔹 2️⃣ NAVIGASI UTAMA (3 TAB)
class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // Daftar halaman/screen untuk setiap tab
  final List<Widget> _pages = [
    HomeScreen(),
    RekomendasiScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green.shade700,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: "Rekomendasi"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: "Riwayat"),
        ],
      ),
    );
  }
}