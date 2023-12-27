
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'drum_pad.dart'; 

class PadGroup extends StatefulWidget {
  final double height;
  final double width;
  final Alignment alignment;

  const PadGroup({super.key, required this.height, required this.width, required this.alignment});

  @override
  _PadGroupState createState() => _PadGroupState();
}

class _PadGroupState extends State<PadGroup> {
  final List<Widget> drumPads = [];
  final AudioPlayer player = AudioPlayer(); // just_audio player

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void addDrumPad(String soundFilePath) {
    drumPads.add(DrumPad(onPressed: () => playSound(soundFilePath)));
    setState(() {});
  }

  void playSound(String soundFilePath) async {
    await player.setAsset(soundFilePath);
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: widget.height,
            width: widget.width,
            alignment: widget.alignment,
            child: GridView.count(
              crossAxisCount: 2, // Number of columns
              children: drumPads,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => showAddDrumPadDialog(context),
          child: const Text('Add DrumPad'),
        )
      ],
    );
  }

  void showAddDrumPadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new DrumPad'),
          content: DropdownButton<String>(
            // Dropdown to select sound file
            items: <String>['sound1.mp3', 'sound2.mp3'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                // Add logic to create a new DrumPad
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
