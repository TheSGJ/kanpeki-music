import 'package:flutter/material.dart';
import 'package:kanpekimusic/consts/colors.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.rectangle,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.music_note),
            )),
            Expanded(
                child: Container(
              color: Colors.yellow,
            )),
          ],
        ),
      ),
    );
  }
}
