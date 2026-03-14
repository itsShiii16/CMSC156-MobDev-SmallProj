import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --- LAB 2 SCREEN CODE ====
class ColorMixerScreen extends StatefulWidget {
  const ColorMixerScreen({super.key});

  @override
  State<ColorMixerScreen> createState() => _ColorMixerScreenState();
}

class _ColorMixerScreenState extends State<ColorMixerScreen> {
  double _redValue = 0;
  double _greenValue = 0;
  double _blueValue = 0;

  @override
  void initState() {
    super.initState();
    _loadSavedColor();
  }

  Future<void> _loadSavedColor() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _redValue = prefs.getDouble('red') ?? 0.0;
      _greenValue = prefs.getDouble('green') ?? 0.0;
      _blueValue = prefs.getDouble('blue') ?? 0.0;
    });
  }

  Future<void> _saveColor() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('red', _redValue);
    await prefs.setDouble('green', _greenValue);
    await prefs.setDouble('blue', _blueValue);
  }

  @override
  Widget build(BuildContext context) {
    Color currentColor = Color.fromRGBO(
      _redValue.toInt(),
      _greenValue.toInt(),
      _blueValue.toInt(),
      1.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 2: Stateful Widgets'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: currentColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Hex: #${currentColor.value.toRadixString(16).toUpperCase().substring(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Red: ${_redValue.toInt()}', style: const TextStyle(fontSize: 16)),
            Slider(
              value: _redValue,
              min: 0,  
              max: 255,
              activeColor: Colors.red,
              thumbColor: Colors.red,
              onChanged: (value) {
                setState(() {
                  _redValue = value;
                });
                _saveColor();
              },
            ),
            Text('Green: ${_greenValue.toInt()}', style: const TextStyle(fontSize: 16)),
            Slider(
              value: _greenValue,
              min: 0,
              max: 255,
              activeColor: Colors.green,
              thumbColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  _greenValue = value;
                });
                _saveColor();
              },
            ),
            Text('Blue: ${_blueValue.toInt()}', style: const TextStyle(fontSize: 16)),
            Slider(
              value: _blueValue,
              min: 0,
              max: 255,
              activeColor: Colors.blue,
              thumbColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  _blueValue = value;
                });
                _saveColor();
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}