import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanpekimusic/consts/colors.dart';
import 'package:kanpekimusic/controller/player_controller.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());
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
                tooltip: 'Previous Song',
                icon: const Icon(Icons.skip_previous, color: whiteColor,),
                onPressed: () {
                },
              ),
              IconButton(
                tooltip: 'Play',
                icon: const Icon(Icons.play_arrow, color: whiteColor,),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Next Song',
                icon: const Icon(Icons.skip_next, color: whiteColor,),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
