import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SettingsPage extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playSound(String fileName) {
    _audioPlayer.play(AssetSource(fileName));
  }

  @override
  Widget build(BuildContext context) {
    // Define rainbow colors for the xylophone
    final List<Color> rainbowColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.purple,
    ];

    // Define note names for display
    final List<String> noteNames = [
      'Do', 'Re', 'Mi', 'Fa', 'So', 'La'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Xylophone'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: List.generate(6, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () => _playSound('audio/note${index + 1}_${noteNames[index]}.wav'),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  color: rainbowColors[index],
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: Center(
                  child: Text(
                    noteNames[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}