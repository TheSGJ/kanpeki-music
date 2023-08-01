import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({
    super.key,
    required this.isElevated,
    required this.isVisible,
  });

  final bool isElevated;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isVisible ? 80.0 : 0,
          child: BottomAppBar(
            elevation: isElevated ? null : 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
      ),
    );
  }
}
