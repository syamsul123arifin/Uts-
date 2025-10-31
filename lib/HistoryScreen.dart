import 'package:flutter/material.dart';
import 'HistoryManager.dart'; // Import manager untuk baca riwayat

// 🔹 6️⃣ HALAMAN HISTORI
class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ambil data riwayat dari HistoryManager
    final List<Map<String, String>> history = HistoryManager.historyList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Perhitungan"),
        backgroundColor: Colors.green.shade600,
        foregroundColor: Colors.white,
      ),
      body: history.isEmpty
          ? Center(
              child: Text(
                "Belum ada riwayat perhitungan.",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: history.map((h) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.history, color: Colors.green),
                    title: Text(h['date']!),
                    subtitle: Text(h['result']!),
                  ),
                );
              }).toList(),
            ),
    );
  }
}