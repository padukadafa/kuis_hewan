import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuis_hewan/app/common/values/app_color.dart';
import 'package:kuis_hewan/app/data/models/animal.dart';
import 'package:kuis_hewan/app/routes/app_pages.dart';

import '../controllers/animal_list_controller.dart';

class AnimalListView extends GetView<AnimalListController> {
  const AnimalListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 2,
                      )
                    ]),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: controller.searchController,
                        focusNode: controller.searchFocus,
                        onTapOutside: (event) =>
                            controller.searchFocus.unfocus(),
                        onChanged: (value) {
                          controller.getAnimalList(filter: value);
                        },
                        decoration: const InputDecoration(
                          hintText: "Cari mamalia",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Obx(() {
                      return Wrap(
                        alignment: WrapAlignment.start,
                        children: List.generate(
                            controller.animalList.value.length, (index) {
                          final Animal animal =
                              controller.animalList.value[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 4.0),
                            child: Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  height:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: AssetImage(controller
                                          .animalList.value[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: InkWell(
                                    onTap: () => Get.toNamed(
                                        Routes.ANIMAL_DETAIL,
                                        arguments: animal),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                          color: AppColors.background,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.7),
                                              offset: const Offset(0, 4),
                                              blurRadius: 4,
                                              spreadRadius: 1,
                                            ),
                                          ]),
                                      child: Text(
                                        animal.name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
