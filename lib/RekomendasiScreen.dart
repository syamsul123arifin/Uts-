import 'package:flutter/material.dart';

// 🔹 5️⃣ HALAMAN REKOMENDASI (PROTEIN & KALORI TINGGI)
class RekomendasiScreen extends StatelessWidget {
  final List<Map<String, String>> rekomendasi = [
    {'img': 'https://i.imgur.com/wBFPc2S.png', 'text': 'Dada ayam panggang'},
    {'img': 'https://i.imgur.com/ef1ER7B.png', 'text': 'Smoothie pisang oat'},
    {'img': 'https://i.imgur.com/NyzrQJ3.png', 'text': 'Susu full cream'},
    {'img': 'https://i.imgur.com/VDHpIcg.png', 'text': 'Nasi putih & daging sapi'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rekomendasi Protein & Kalori Tinggi"),
        backgroundColor: Colors.green.shade600,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: rekomendasi.map((item) {
          return Card(
            child: ListTile(
              leading: Image.network(
                item['img']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                item['text']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
