import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kuis_hewan/app/data/dummy/animal.dart';
import 'package:kuis_hewan/app/data/models/animal.dart';

class QuizController extends GetxController {
  final answerIndex = 0.obs;
  final selectedAnswer = 0.obs;
  List<Animal> showedAnimals = [];
  List<Animal> animals = [];

  final count = 0.obs;
  @override
  void onInit() {
    animals = AnimalData.animalList();
    animals.shuffle();
    super.onInit();
  }

  @override
  void onReady() {
    answerIndex.value = Random().nextInt(4);
    super.onReady();
  }

  checkAnswer() async {
    if (selectedAnswer.value == answerIndex.value) {
      await Get.defaultDialog(
          backgroundColor: Colors.green,
          title: "Selamat",
          titleStyle: const TextStyle(color: Colors.white),
          content: const Text(
            "Kamu berhasil menjawab dengan benar",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ));
    } else {
      await Get.defaultDialog(
          backgroundColor: Colors.red,
          title: "Maaf",
          titleStyle: const TextStyle(color: Colors.white),
          content: const Text(
            "Kamu belum berhasil menjawab dengan benar",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ));
    }

    answerIndex.value = Random().nextInt(4);
    animals.shuffle();
    selectedAnswer.value = 0;
  }

  playAudio() async {
    final animal = animals[answerIndex.value];
    final player = AudioPlayer();
    player.stop();
    await player.setUrl("asset:${animal.audioAsset}");

    player.play();
  }
}
