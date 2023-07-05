import 'package:get/get.dart';

import '../controllers/animal_detail_controller.dart';

class AnimalDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimalDetailController>(
      () => AnimalDetailController(),
    );
  }
}
