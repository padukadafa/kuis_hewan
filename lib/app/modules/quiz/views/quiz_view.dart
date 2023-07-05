import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuis_hewan/app/common/values/app_color.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40, bottom: 25),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Text(
                    "Kuis",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                const Text(
                  "Hewan Apakah ini",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(controller
                            .animals[controller.answerIndex.value].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.playAudio();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: const Text(
                      "Dengar suaranya",
                      style: TextStyle(color: Colors.black),
                    )),
                Expanded(
                  child: Obx(() {
                    return Wrap(
                      children: List.generate(4, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 4.0),
                          child: Column(
                            children: [
                              Material(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () async {
                                    controller.selectedAnswer.value = index;
                                    await controller.checkAnswer();
                                  },
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.animals[index].name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          controller
                                              .animals[
                                                  controller.answerIndex.value]
                                              .name,
                                          style: const TextStyle(fontSize: 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
