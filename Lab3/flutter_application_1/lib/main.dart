import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        title: const Text('My Flutter Labs', style: TextStyle(fontWeight: FontWeight.bold)),
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
                backgroundColor: const Color(0xFF1DB954), // Spotify Green
                foregroundColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
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

// --- LAB 1 SCREEN (TAB BAR) ---
class Lab1Screen extends StatelessWidget {
  const Lab1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lab 1: UI Layout'),
          bottom: const TabBar(
            labelColor: Colors.deepPurple,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.deepPurple,
            tabs: [
              Tab(icon: Icon(Icons.widgets), text: 'Implementation'),
              Tab(icon: Icon(Icons.description), text: 'Layout Description'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Your Lab 1 Implementation
            Container(
              color: const Color(0xFF4A3B3B), // Muted background from your code
              child: const Center(
                child: SpotifyWidget(),
              ),
            ),
            // Tab 2: Layout Description Text
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Spotify Widget Layout Structure:',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "• Container: The main wrapper uses a fixed width, dark background, heavily rounded corners, and a custom drop shadow to create a card-like widget effect.\n\n"
                      "• Column: Used as the primary layout structure to stack the album art, text, progress bar, and controls vertically.\n\n"
                      "• Stack & ClipRRect: The album image is placed inside a Stack with a ClipRRect to round its corners and apply a dark blend mode overlay.\n\n"
                      "• Rows: Multiple Rows are utilized throughout the widget. They are used to align the 'E' tag next to the song title, layout the timestamps around the progress bar, space out the media control icons, and position the volume icons around the volume slider.\n\n"
                      "• Expanded & LinearProgressIndicator: To create the progress bar and volume slider, LinearProgressIndicators are wrapped in Expanded widgets inside their respective Rows, allowing them to fill the available horizontal space perfectly.",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- LAB 1 WIDGET (Your exact code) ---
class SpotifyWidget extends StatelessWidget {
  const SpotifyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryText = Colors.white;
    const Color secondaryText = Colors.white54;
    const Color widgetBackground = Color(0xFF121212);
    const Color iconColor = Colors.white;

    return Container(
      width: 340,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: widgetBackground,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 5,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/image_640283.jpeg',
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.2),
                    colorBlendMode: BlendMode.darken,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 300, width: 300, color: Colors.grey.shade800,
                      child: const Center(child: Icon(Icons.image, size: 50, color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            "iPhone",
            style: TextStyle(color: secondaryText, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text(
                "Timeless (with Playboi Carti)",
                style: TextStyle(
                    color: primaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: const Text("E", style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),),
              )
            ],
          ),
          const SizedBox(height: 4),
           const Text(
            "The Weeknd, Playboi Carti — Timeless",
            style: TextStyle(color: secondaryText, fontSize: 15),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              const Text("1:31", style: TextStyle(color: secondaryText, fontSize: 12)),
              const SizedBox(width: 10),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const LinearProgressIndicator(
                    value: 0.35, 
                    backgroundColor: Colors.white24,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 5,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text("-2:45", style: TextStyle(color: secondaryText, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 24),
              const Icon(Icons.skip_previous_rounded, color: iconColor, size: 40),
              const Icon(Icons.pause_rounded, color: iconColor, size: 50),
              const Icon(Icons.skip_next_rounded, color: iconColor, size: 40),
              Icon(Icons.airplay_rounded, color: iconColor.withOpacity(0.7), size: 24),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.volume_mute_rounded, color: secondaryText, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const LinearProgressIndicator(
                    value: 0.75, 
                    backgroundColor: Colors.white24,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 5,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Icon(Icons.volume_up_rounded, color: secondaryText, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}

// --- LAB 2 SCREEN (Your exact code) ---
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