import 'package:flutter/material.dart';
import 'package:kanpekimusic/consts/colors.dart';
import 'package:kanpekimusic/consts/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgDarkColor,
        appBar: AppBar(
          backgroundColor: bgDarkColor,
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
              physics: const BouncingScrollPhysics(),
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      tileColor: bgColor,
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
                      trailing: const Icon(Icons.play_arrow,
                          color: whiteColor, size: 22),
                    ));
              }),
        ));
  }
}
