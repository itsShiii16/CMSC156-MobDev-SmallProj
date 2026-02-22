import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Color(0xFF4A3B3B), // Muted background from the screenshot
      body: Center(
        child: SpotifyWidget(),
      ),
    ),
  ));
}

class SpotifyWidget extends StatelessWidget {
  const SpotifyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Define standard colors based on the image
    const Color primaryText = Colors.white;
    const Color secondaryText = Colors.white54; // Light Grey
    const Color widgetBackground = Color(0xFF121212); // Very dark grey/black
    const Color iconColor = Colors.white;

    return Container(
      width: 340, // Fixed width for widget feel
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: widgetBackground,
        borderRadius: BorderRadius.circular(35), // Heavily rounded corners
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
          // --- 1. Album Art Stack ---
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
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),

          // --- 2. Track Information ---
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
              // Explicit 'E' icon
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

          // --- 3. Progress Bar Row ---
          Row(
            children: [
              const Text("1:31", style: TextStyle(color: secondaryText, fontSize: 12)),
              const SizedBox(width: 10),
              Expanded(
                // Visual progress bar using LinearProgressIndicator
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const LinearProgressIndicator(
                    value: 0.35, // Approx 1:31 
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

          // --- 4. Controls Row ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 24), // Spacer to balance Airplay icon
              const Icon(Icons.skip_previous_rounded, color: iconColor, size: 40),
              // Using a slightly larger icon for Pause
              const Icon(Icons.pause_rounded, color: iconColor, size: 50),
              const Icon(Icons.skip_next_rounded, color: iconColor, size: 40),
              // Airplay/Cast Icon
              Icon(Icons.airplay_rounded, color: iconColor.withOpacity(0.7), size: 24),
            ],
          ),
          const SizedBox(height: 20),

          // --- 5. Volume Slider Row ---
          Row(
            children: [
              Icon(Icons.volume_mute_rounded, color: secondaryText, size: 20),
              const SizedBox(width: 10),
              Expanded(
                 // Visual volume slider
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