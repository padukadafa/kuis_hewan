import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuis_hewan/app/common/values/app_color.dart';
import 'package:kuis_hewan/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/animals.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(Routes.QUIZ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE1E7E5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "Kuis",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.ANIMAL_TYPES),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAE6E6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "Hewan",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
