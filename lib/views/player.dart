import 'package:flutter/material.dart';
import 'package:kanpekimusic/consts/colors.dart';
import 'package:kanpekimusic/consts/text_style.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.music_note),
            )),
            const SizedBox(height: 12),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: bgColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                children: [
                  Text(
                    "Music name",
                    style: ourStyle(
                      color: whiteColor,
                      family: bold,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Artist name",
                    style: ourStyle(
                      color: whiteColor,
                      family: regular,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        "0.0",
                        style: ourStyle(),
                      ),
                      Expanded(
                          child: Slider(
                              thumbColor: sliderColor,
                              activeColor: sliderColor,
                              inactiveColor: whiteColor,
                              value: 0.0,
                              onChanged: (newValue) {})),
                      Text(
                        "4:00",
                        style: ourStyle(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_previous_rounded,
                              size: 50, color: buttonColor)),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: sliderColor,
                        child: Transform.scale(
                          scale: 1.3,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.play_arrow_rounded,
                                color: buttonColor,
                              )),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_next_rounded,
                              size: 50, color: buttonColor))
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
