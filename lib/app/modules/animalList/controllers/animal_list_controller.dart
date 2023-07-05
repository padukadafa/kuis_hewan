import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuis_hewan/app/data/dummy/animal.dart';
import 'package:kuis_hewan/app/data/models/animal.dart';

class AnimalListController extends GetxController {
  final searchController = TextEditingController();
  final searchFocus = FocusNode();
  Rx<List<Animal>> animalList = Rx([]);

  final count = 0.obs;

  @override
  void onReady() {
    getAnimalList();
    super.onReady();
  }

  getAnimalList({String filter = ""}) {
    final animals = AnimalData.animalList(animalType: Get.arguments);
    final List<Animal> filteredAnimals = [];

    for (int i = 0; i < animals.length; i++) {
      if (animals[i].name.toLowerCase().contains(filter)) {
        filteredAnimals.add(animals[i]);
      }
    }
    animalList.value = filteredAnimals;
  }
}
