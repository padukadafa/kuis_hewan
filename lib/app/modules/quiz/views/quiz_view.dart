import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kuis_hewan/app/common/values/app_color.dart';
import 'package:kuis_hewan/app/data/dummy/animal.dart';
import 'package:kuis_hewan/app/data/models/animal.dart';

class QuizView extends StatefulWidget {
  QuizView({Key? key}) : super(key: key);

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  List<Animal> animals = [];
  final player = AudioPlayer();
  int _answerIndex = Random().nextInt(3);

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    animals = AnimalData.animalList();

    super.initState();
  }

  @override
  void dispose() {
    player.stop();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    playAudio(speaker: "assets/audio/speaker.mp3");

    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    playAudio();
                  },
                  icon: const Icon(Icons.volume_up),
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        checkAnswer(index);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(
                              animals[index].image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  checkAnswer(int index) async {
    print(animals[index].name);
    print(animals[_answerIndex].name);
    if (index == _answerIndex) {
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
        ),
      );
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
    animals.shuffle();
    setState(() {
      _answerIndex = Random().nextInt(3);
    });
  }

  playAudio({int? index, String? speaker}) async {
    final Animal animal;
    if (index != null) {
      animal = animals[index];
    } else {
      animal = animals[_answerIndex];
    }
    player.stop();
    if (speaker != null) {
      await player.setAsset(speaker);
      await player.play();
    }
    player.stop();
    await player.setAsset(animal.audioAsset);

    player.play();
  }
}
