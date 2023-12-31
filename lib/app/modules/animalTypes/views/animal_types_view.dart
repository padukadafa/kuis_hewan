import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuis_hewan/app/common/values/app_color.dart';
import 'package:kuis_hewan/app/common/values/app_constant.dart';

import '../controllers/animal_types_controller.dart';

class AnimalTypesView extends GetView<AnimalTypesController> {
  const AnimalTypesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.background,
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(AppConstant.ANIMAL_TYPE_BACKGROUND),
                fit: BoxFit.cover,
              )),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 50,
                        width: 170,
                        margin: const EdgeInsets.only(bottom: 14),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff7BEA93),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Jenis Hewan",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ),
                      Column(
                        children: List.generate(controller.actionList.length,
                            (index) {
                          final animal = controller.actionList[index];
                          return Container(
                            height: 50,
                            width: 170,
                            margin: const EdgeInsets.only(top: 24),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: animal['color'],
                              ),
                              onPressed: animal['action'],
                              child: Text(
                                animal['title'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
