import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuis_hewan/app/data/models/animal.dart';
import 'package:kuis_hewan/app/routes/app_pages.dart';

class AnimalTypesController extends GetxController {
  List<Map<String, dynamic>> actionList = [
    {
      "title": "Mamalia",
      "action": () =>
          Get.toNamed(Routes.ANIMAL_LIST, arguments: AnimalType.mamalia),
      "color": const Color(0xff7BA7EA),
    },
    {
      "title": "Unggas",
      "action": () =>
          Get.toNamed(Routes.ANIMAL_LIST, arguments: AnimalType.unggas),
      "color": const Color(0xffFA3C3C),
    },
    {
      "title": "Serangga",
      "action": () =>
          Get.toNamed(Routes.ANIMAL_LIST, arguments: AnimalType.serangga),
      "color": const Color(0xff26FC03),
    },
    {
      "title": "Reptil",
      "action": () =>
          Get.toNamed(Routes.ANIMAL_LIST, arguments: AnimalType.reptil),
      "color": const Color(0xffF7FC03),
    },
  ];

  final count = 0.obs;
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

  void increment() => count.value++;
}
