import 'package:flutter/material.dart';
import 'package:tugas8/screens/screen_input.dart';
import 'services/preferences_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = PreferencesService(); 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<String?>(
        future: prefs.getUsername(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return ScreenInput();
          }

          final name = snapshot.data;

          if (name == null || name.isEmpty) {
            return ScreenInput();
          }

          return Scaffold(
            appBar: AppBar(title: Text("Beranda")),
            body: Center(
              child: Text(
                "Halo, $name!",
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        },
      ),
    );
  }
}
