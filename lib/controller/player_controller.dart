import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();

  @override
  void onInit() {
    super.onInit();
    checkPermissions();
  }

  void checkPermissions() async {
    var permissionStatus = await Permission.manageExternalStorage.status;
    if (permissionStatus.isGranted) {
      // Permission granted, perform desired actions
      queryAudioFiles();
    } else if (permissionStatus.isDenied || permissionStatus.isPermanentlyDenied) {
      // Permission denied or permanently denied, handle it accordingly
      // For example, log an error or show an error message to the user
      // You can use a logging library or a custom error handling mechanism
      // logger.error('Permission denied');
      // or
      // showErrorDialog('Permission denied');
    } else {
      // Permission has not been requested yet, request it
      permissionStatus = await Permission.manageExternalStorage.request();
      if (permissionStatus.isGranted) {
        // Permission granted, perform desired actions
        queryAudioFiles();
      } else {
        // Permission still not granted, handle it accordingly
        // For example, log an error or show an error message to the user
        // logger.error('Permission not granted');
        // or
        // showErrorDialog('Permission not granted');
      }
    }
  }

  void queryAudioFiles() async {
    // Query audio files using the audioQuery instance
    // ignore: unused_local_variable
    final songs = await audioQuery.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true
    );

    // Perform desired actions with the queried songs
    // For example, store the songs in a list or update the UI
    // You can log the queried songs or pass them to other parts of your application
    // logger.debug('Queried songs: $songs');
    // or
    // processQueriedSongs(songs);
  }
}
