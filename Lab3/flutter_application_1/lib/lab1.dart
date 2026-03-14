import 'package:flutter/material.dart';

// --- LAB 1 SCREEN (TAB BAR) ---
class Lab1Screen extends StatelessWidget {
  const Lab1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // wrap whole screen and set length to 2 ( 2 tabs )
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lab 1: UI Layout'),
          //TabBar for clickable buttons
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
        // TabBarView - for content in the middle
        body: TabBarView(
          children: [
            Container(
              color: const Color(0xFF4A3B3B), 
              child: const Center(
                child: SpotifyWidget(),
              ),
            ),
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

// --- LAB 1 WIDGET CODE ====
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
          const Text("iPhone", style: TextStyle(color: secondaryText, fontSize: 14)),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text(
                "Timeless (with Playboi Carti)",
                style: TextStyle(color: primaryText, fontSize: 18, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: const Text("E", style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
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