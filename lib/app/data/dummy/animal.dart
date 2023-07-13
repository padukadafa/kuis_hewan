import 'package:kuis_hewan/app/data/models/animal.dart';

class AnimalData {
  static List<Animal> animalList({AnimalType? animalType}) {
    if (animalType == null) {
      return animals;
    }
    final animalList =
        animals.where((element) => element.animalType == animalType).toList();
    return animalList;
  }

  static List<Animal> animals = [
    Animal(
      name: "Anjing",
      audioAsset: "assets/audio/dog.wav",
      quizAudioAsset: "assets/audio/dog.wav",
      image: "assets/images/dog.jpg",
      animalType: AnimalType.mamalia,
    ),
    Animal(
      name: "Anjing",
      audioAsset: "assets/audio/dog.wav",
      quizAudioAsset: "assets/audio/dog.wav",
      image: "assets/images/dog.jpg",
      animalType: AnimalType.mamalia,
    ),
    Animal(
      name: "Anjing",
      audioAsset: "assets/audio/dog.wav",
      quizAudioAsset: "assets/audio/dog.wav",
      image: "assets/images/dog.jpg",
      animalType: AnimalType.mamalia,
    ),
    Animal(
      name: "Anjing",
      audioAsset: "assets/audio/dog.wav",
      quizAudioAsset: "assets/audio/dog.wav",
      image: "assets/images/dog.jpg",
      animalType: AnimalType.mamalia,
    ),
    Animal(
      name: "Anjing",
      audioAsset: "assets/audio/dog.wav",
      quizAudioAsset: "assets/audio/dog.wav",
      image: "assets/images/dog.jpg",
      animalType: AnimalType.mamalia,
    ),
    Animal(
      name: "Ayam",
      audioAsset: "assets/audio/chicken.wav",
      quizAudioAsset: "assets/audio/chicken.wav",
      image: "assets/images/chicken.jpg",
      animalType: AnimalType.unggas,
    ),
    Animal(
      name: "Angsa",
      audioAsset: "assets/audio/chicken.wav",
      quizAudioAsset: "assets/audio/chicken.wav",
      image: "assets/images/angsa.jpg",
      animalType: AnimalType.unggas,
    ),
    Animal(
      name: "buaya",
      audioAsset: "assets/audio/crocodile.mp3",
      quizAudioAsset: "assets/audio/crocodile.mp3",
      image: "assets/images/crocodile.jpg",
      animalType: AnimalType.reptil,
    ),
    Animal(
      name: "Jangkrik",
      audioAsset: "assets/audio/jangkrik.mp3",
      quizAudioAsset: "assets/audio/jangkrik.mp3",
      image: "assets/images/jangkrik.jpg",
      animalType: AnimalType.serangga,
    ),
  ];
}
