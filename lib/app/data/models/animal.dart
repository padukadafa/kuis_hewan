enum AnimalType {
  mamalia,
  unggas,
  serangga,
  reptil,
}

class Animal {
  final String name;
  final String audioAsset;
  final String image;
  final AnimalType animalType;
  Animal({
    required this.name,
    required this.audioAsset,
    required this.image,
    required this.animalType,
  });
}
