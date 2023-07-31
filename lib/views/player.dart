import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanpekimusic/consts/colors.dart';
import 'package:kanpekimusic/consts/text_style.dart';
import 'package:kanpekimusic/controller/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends StatelessWidget {
  final SongModel data;
  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();

    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            Expanded(
                child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 260,
              width: 260,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: QueryArtworkWidget(
                id: data.id,
                type: ArtworkType.AUDIO,
                artworkHeight: double.infinity,
                artworkWidth: double.infinity,
                nullArtworkWidget: const Icon(
                  Icons.music_note,
                  size: 60,
                  color: whiteColor,
                ),
              ),
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
                    data.displayNameWOExt,
                    style: ourStyle(
                      color: whiteColor,
                      family: bold,
                      size: 26,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    data.artist.toString(),
                    style: ourStyle(
                      color: whiteColor,
                      family: regular,
                      size: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => Row(
                      children: [
                        Text(
                          controller.position.value,
                          style: ourStyle(),
                        ),
                        Expanded(
                            child: Slider(
                                thumbColor: sliderColor,
                                activeColor: sliderColor,
                                inactiveColor: whiteColor,
                                min: const Duration(seconds: 0).inSeconds.toDouble(),
                                max: controller.max.value,
                                value: controller.value.value,
                                onChanged: (newValue) {
                                  controller.changeDurationToSeconds(
                                      newValue.toInt());
                                  newValue = newValue;
                                })),
                        Text(
                          controller.duration.value,
                          style: ourStyle(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_previous_rounded,
                              size: 50, color: buttonColor)),
                      Obx(
                        () => CircleAvatar(
                          radius: 30,
                          backgroundColor: sliderColor,
                          child: Transform.scale(
                            scale: 1.3,
                            child: IconButton(
                                onPressed: () {
                                  if (controller.isPlaying.value) {
                                    controller.audioPlayer.pause();
                                    controller.isPlaying(false);
                                  } else {
                                    controller.audioPlayer.play();
                                    controller.isPlaying(true);
                                  }
                                },
                                icon: controller.isPlaying.value
                                    ? const Icon(
                                        Icons.pause,
                                        color: buttonColor,
                                      )
                                    : const Icon(
                                        Icons.play_arrow_rounded,
                                        color: buttonColor,
                                      )),
                          ),
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
