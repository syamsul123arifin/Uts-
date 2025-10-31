import 'package:flutter/material.dart';
import 'InputScreen.dart'; // Import halaman kalkulator

// 🔹 (BARU) HALAMAN HOME
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.green.shade600,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home_work, size: 80, color: Colors.green.shade400),
              const SizedBox(height: 20),
              const Text(
                "Selamat Datang di Calorie Calculator",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Mulai lacak kebutuhan kalori harian Anda untuk mencapai tujuan kesehatan Anda.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.calculate, color: Colors.white),
                label: const Text("Mulai Hitung Kalori",
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16)),
                onPressed: () {
                  // Pindah ke halaman InputScreen (Kalkulator)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}