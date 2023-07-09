import 'package:flutter/material.dart';
import 'package:kanpekimusic/consts/colors.dart';
import 'package:kanpekimusic/consts/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: whiteColor))
          ],
          leading: const Icon(
            Icons.sort_rounded,
            color: whiteColor,
          ),
          title: Text(
            "Kanpeki Music",
            style: ourStyle(family: bold, size: 16),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        "Music Name",
                        style: ourStyle(family: bold, size: 14),
                      ),
                      subtitle: Text(
                        "Artist Name",
                        style: ourStyle(family: regular, size: 11),
                      ),
                      leading: const Icon(
                        Icons.music_note,
                        color: whiteColor,
                        size: 30,
                      ),
                      trailing:
                          const Icon(Icons.play_arrow, color: whiteColor, size: 22),
                    ));
              }),
        ));
  }
}
