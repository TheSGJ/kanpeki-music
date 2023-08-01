import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanpekimusic/consts/colors.dart';
import 'package:kanpekimusic/controller/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class BottomTabBar extends StatelessWidget {
  final List<SongModel> data;
  const BottomTabBar({super.key, required this.data});

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
                tooltip: 'Previous Song',
                icon: const Icon(Icons.skip_previous),
                onPressed: () {
                  controller.playSong(data[controller.playIndex.value - 1].uri,
                      controller.playIndex.value - 1);
                },
              ),
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
              IconButton(
                color: whiteColor,
                tooltip: 'Next Song',
                icon: const Icon(
                  Icons.skip_next,
                ),
                onPressed: () {
                  controller.playSong(data[controller.playIndex.value + 1].uri,
                      controller.playIndex.value + 1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
