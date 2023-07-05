import 'package:get/get.dart';

import '../controllers/animal_types_controller.dart';

class AnimalTypesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimalTypesController>(
      () => AnimalTypesController(),
    );
  }
}
