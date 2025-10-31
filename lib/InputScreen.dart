import 'package:flutter/material.dart';
import 'ResultScreen.dart'; // Import halaman hasil

// 🔹 3️⃣ HALAMAN INPUT (KALKULATOR)
class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();
  String _gender = 'male';
  String _activity = 'sedentary';
  String _goal = 'maintain';
  int _age = 0;
  double _weight = 0, _height = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Kalori"),
        backgroundColor: Colors.green.shade600,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                value: _gender,
                decoration: const InputDecoration(labelText: "Jenis Kelamin"),
                items: [
                  DropdownMenuItem(value: 'male', child: Text("Laki-laki")),
                  DropdownMenuItem(value: 'female', child: Text("Perempuan")),
                ],
                onChanged: (val) => setState(() => _gender = val!),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Usia (tahun)"),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? "Masukkan usia" : null,
                onSaved: (v) => _age = int.parse(v!),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Berat (kg)"),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? "Masukkan berat" : null,
                onSaved: (v) => _weight = double.parse(v!),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Tinggi (cm)"),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? "Masukkan tinggi" : null,
                onSaved: (v) => _height = double.parse(v!),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _activity,
                decoration: const InputDecoration(labelText: "Aktivitas"),
                items: [
                  'sedentary',
                  'lightly_active',
                  'moderately_active',
                  'very_active'
                ]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) => setState(() => _activity = v!),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _goal,
                decoration: const InputDecoration(labelText: "Tujuan"),
                items: [
                  DropdownMenuItem(
                      value: 'maintain', child: Text("Pertahankan")),
                  DropdownMenuItem(value: 'lose', child: Text("Turunkan")),
                  DropdownMenuItem(value: 'gain', child: Text("Naikkan")),
                ],
                onChanged: (v) => setState(() => _goal = v!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Pindah ke halaman Hasil dan kirim datanya
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          gender: _gender,
                          age: _age,
                          weight: _weight,
                          height: _height,
                          activity: _activity,
                          goal: _goal,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700),
                child: const Text("Hitung Kalori",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}