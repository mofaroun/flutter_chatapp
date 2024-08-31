import "package:flutter/material.dart";
import "package:flutter_bounceable/flutter_bounceable.dart";
import 'package:audioplayers/audioplayers.dart';

class MyButton extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  const MyButton({super.key, required this.label, this.onTap});

  void playButtonSound() async {
    final player = AudioPlayer();
    await player.setSource(AssetSource('pop4.wav'));
    player.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        playButtonSound();
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 100),
        child: Center(
          child: Text(label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              )),
        ),
      ),
    );
  }
}
