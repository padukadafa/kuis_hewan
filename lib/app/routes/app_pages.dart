import 'package:get/get.dart';

import '../modules/animalDetail/bindings/animal_detail_binding.dart';
import '../modules/animalDetail/views/animal_detail_view.dart';
import '../modules/animalList/bindings/animal_list_binding.dart';
import '../modules/animalList/views/animal_list_view.dart';
import '../modules/animalTypes/bindings/animal_types_binding.dart';
import '../modules/animalTypes/views/animal_types_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/quiz/bindings/quiz_binding.dart';
import '../modules/quiz/views/quiz_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ANIMAL_TYPES,
      page: () => const AnimalTypesView(),
      binding: AnimalTypesBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ,
      page: () => const QuizView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.ANIMAL_LIST,
      page: () => const AnimalListView(),
      binding: AnimalListBinding(),
    ),
    GetPage(
      name: _Paths.ANIMAL_DETAIL,
      page: () => const AnimalDetailView(),
      binding: AnimalDetailBinding(),
    ),
  ];
}
