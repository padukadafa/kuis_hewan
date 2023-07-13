import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kuis_hewan/app/data/models/animal.dart';

class AnimalDetailController extends GetxController {
  final count = 0.obs;
  final Animal animal = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  playAudio() async {
    final player = AudioPlayer();
    await player.setUrl("asset:${animal.quizAudioAsset}");

    player.play();
  }
}
