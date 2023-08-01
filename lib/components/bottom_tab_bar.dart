import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          duration: const Duration(milliseconds: 200),
          height: controller.isAudioPlayerNotNull.value ? 80.0 : 0,
          child: Row(
            children: <Widget>[
              IconButton(
                tooltip: 'Open popup menu',
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  final SnackBar snackBar = SnackBar(
                    content: const Text('Yay! A SnackBar!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Favorite',
                icon: const Icon(Icons.favorite),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
