import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanpekimusic/consts/colors.dart';
import 'package:kanpekimusic/consts/text_style.dart';
import 'package:kanpekimusic/controller/player_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlayerController());

    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
        backgroundColor: bgDarkColor,
        actions: [
          IconButton(
            onPressed: () {
              // Implement search functionality
              _onSearchPressed();
            },
            icon: const Icon(Icons.search, color: whiteColor),
          ),
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
        future: _retrieveSongs(controller),
        builder: (BuildContext context, AsyncSnapshot<List<SongModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error loading songs!",
                style: ourStyle(),
              ),
            );
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No songs found!",
                style: ourStyle(),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final song = snapshot.data![index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      tileColor: bgColor,
                      title: Text(
                        song.title,
                        style: ourStyle(family: bold, size: 14),
                      ),
                      subtitle: Text(
                        song.artist ?? "",
                        style: ourStyle(family: regular, size: 11),
                      ),
                      leading: const Icon(
                        Icons.music_note,
                        color: whiteColor,
                        size: 30,
                      ),
                      trailing: const Icon(
                        Icons.play_arrow,
                        color: whiteColor,
                        size: 22,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  Future<List<SongModel>> _retrieveSongs(PlayerController controller) async {
    final permissionStatus = await Permission.manageExternalStorage.status;
    if (permissionStatus.isDenied || permissionStatus.isPermanentlyDenied) {
      await Permission.manageExternalStorage.request();
    }

    if (permissionStatus.isGranted || permissionStatus.isLimited) {
      return await controller.audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: null,
        uriType: UriType.EXTERNAL,
      );
    } else {
      return [];
    }
  }

  void _onSearchPressed() {
    // Implement search functionality
    // This method will be called when the search button is pressed in the AppBar
    // You can show a search dialog, navigate to a search screen, or handle search in any other way
  }
}
