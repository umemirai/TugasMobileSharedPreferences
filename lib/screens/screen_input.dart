import 'package:flutter/material.dart';
import '../../services/preferences_service.dart';

class ScreenInput extends StatefulWidget {
  @override
  _ScreenInputState createState() => _ScreenInputState();
}

class _ScreenInputState extends State<ScreenInput> {
  final TextEditingController nameCtrl = TextEditingController();
  final PreferencesService prefs = PreferencesService();

  void save() async {
    await prefs.saveUsername(nameCtrl.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Nama disimpan!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input Nama")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: "Masukkan Nama",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: save,
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
