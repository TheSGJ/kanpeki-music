import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanpekimusic/consts/colors.dart';
import 'package:kanpekimusic/controller/player_controller.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();
    return GestureDetector(
      onTap: () {},
      child: Obx(
        () => AnimatedContainer(
          color: bottomTabPlayerColor,
          duration: const Duration(milliseconds: 200),
          height: controller.isAudioPlayerNotNull.value ? 80.0 : 0,
          child: Row(
            children: <Widget>[
              IconButton(
                color: whiteColor,
                tooltip: 'Play',
                icon: controller.isPlaying.value
                    ? const Icon(
                        Icons.play_arrow,
                      )
                    : const Icon(Icons.pause),
                onPressed: () {
                  if (controller.isPlaying.value) {
                    controller.audioPlayer.pause();
                    controller.isPlaying(false);
                  } else {
                    controller.audioPlayer.play();
                    controller.isPlaying(true);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
