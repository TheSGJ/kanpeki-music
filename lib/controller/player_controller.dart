import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();

  var playIndex = 0.obs;
  var isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkPermissions();
  }

  playSong(String? uri, index) async {
    playIndex.value = index;
    try {
      audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      audioPlayer.play();
      isPlaying(true);
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  checkPermissions() async {
    var perm = await Permission.storage.request();
    var permTiramsu = await Permission.audio.request();

    if (perm.isGranted || permTiramsu.isGranted) {
    } else {
      checkPermissions();
    }
  }
}
