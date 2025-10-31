import 'package:flutter/material.dart';
import 'HistoryManager.dart'; // Import manager untuk simpan riwayat

// 🔹 4️⃣ HALAMAN HASIL PERHITUNGAN
class ResultScreen extends StatefulWidget {
  final String gender;
  final int age;
  final double weight, height;
  final String activity, goal;

  const ResultScreen({
    super.key,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.activity,
    required this.goal,
  });

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  double bmr = 0;
  double tdee = 0;
  double target = 0;

  double getBMR() => widget.gender == 'male'
      ? 88.36 + (13.4 * widget.weight) + (4.8 * widget.height) - (5.7 * widget.age)
      : 447.6 + (9.2 * widget.weight) + (3.1 * widget.height) - (4.3 * widget.age);

  double getTDEE(double bmr) {
    double multiplier = {
      'sedentary': 1.2,
      'lightly_active': 1.375,
      'moderately_active': 1.55,
      'very_active': 1.725
    }[widget.activity]!;
    return bmr * multiplier;
  }

  double getTarget(double tdee) =>
      widget.goal == 'lose' ? tdee - 500 : widget.goal == 'gain' ? tdee + 500 : tdee;

  @override
  void initState() {
    super.initState();
    // Lakukan perhitungan
    bmr = getBMR();
    tdee = getTDEE(bmr);
    target = getTarget(tdee);

    // ✨ SIMPAN KE RIWAYAT
    _saveToHistory();
  }

  void _saveToHistory() {
    final now = DateTime.now();
    // Format tanggal sederhana
    final String date = "${now.day}/${now.month}/${now.year}";
    final String result = "TDEE: ${tdee.toStringAsFixed(0)} kcal";

    // Masukkan data baru ke HistoryManager
    HistoryManager.historyList.insert(0, {
      'date': date,
      'result': result,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Perhitungan"),
        backgroundColor: Colors.green.shade600,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("BMR: ${bmr.toStringAsFixed(0)} kcal",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("TDEE: ${tdee.toStringAsFixed(0)} kcal",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("Target: ${target.toStringAsFixed(0)} kcal",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}