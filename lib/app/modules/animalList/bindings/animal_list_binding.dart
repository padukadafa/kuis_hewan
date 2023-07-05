import 'package:get/get.dart';

import '../controllers/animal_list_controller.dart';

class AnimalListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimalListController>(
      () => AnimalListController(),
    );
  }
}
