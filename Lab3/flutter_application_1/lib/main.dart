// File: lib/main.dart
import 'package:flutter/material.dart';

import 'lab1.dart'; 
import 'lab2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Labs',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// --- HOME SCREEN ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LAB ACTIVITY 3', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button 1: Navigates to Lab 1
            ElevatedButton.icon(
              icon: const Icon(Icons.music_note, size: 28),
              label: const Text('Laboratory Exercise 1', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                backgroundColor: const Color(0xFF1DB954), 
                foregroundColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  //automatically handles the transition and has arrow key for back
                  MaterialPageRoute(builder: (context) => const Lab1Screen()),
                );
              },
            ),
            const SizedBox(height: 30),
            
            // Button 2: Navigates to Lab 2
            ElevatedButton.icon(
              icon: const Icon(Icons.color_lens, size: 28),
              label: const Text('Laboratory Exercise 2', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  //automatically handles the transition and has arrow key for back
                  MaterialPageRoute(builder: (context) => const ColorMixerScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}