import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanpekimusic/components/bottom_tab_bar.dart';
import 'package:kanpekimusic/consts/colors.dart';
import 'package:kanpekimusic/consts/text_style.dart';
import 'package:kanpekimusic/controller/player_controller.dart';
import 'package:kanpekimusic/views/player.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<SongModel>? songData;
    var controller = Get.put(PlayerController());
    return Scaffold(
        backgroundColor: bgDarkColor,
        bottomNavigationBar:  BottomAppBar(
          child: BottomTabBar(data: songData!),
        ),
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
        body: FutureBuilder<List<SongModel>>(
          future: controller.audioQuery.querySongs(
            ignoreCase: true,
            orderType: OrderType.ASC_OR_SMALLER,
            sortType: null,
            uriType: UriType.EXTERNAL,
          ),
          builder: (BuildContext context, snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data!.isEmpty) {
              return Center(
                  child: Text(
                "No song found!",
                style: ourStyle(),
              ));
            } else {
              songData = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          child: Obx(() => (ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                tileColor: bgColor,
                                title: Text(
                                  snapshot.data![index].title,
                                  style: ourStyle(family: bold, size: 14),
                                ),
                                subtitle: Text(
                                  "${snapshot.data![index].artist}",
                                  style: ourStyle(family: regular, size: 11),
                                ),
                                leading: QueryArtworkWidget(
                                  id: snapshot.data![index].id,
                                  type: ArtworkType.AUDIO,
                                  nullArtworkWidget: const Icon(
                                    Icons.music_note,
                                    color: whiteColor,
                                    size: 30,
                                  ),
                                ),
                                
                                onTap: () {
                                  Get.to(() => Player(data: snapshot.data!));
                                  controller.playSong(
                                      snapshot.data![index].uri, index);
                                },
                              ))));
                    }),
              );
            }
          },
        ));
  }
}
