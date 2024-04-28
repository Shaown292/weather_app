
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:weather_app/constant/image_path/imagePath.dart';
import 'package:weather_app/constant/textStyle.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width ,
        height: Get.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff97ABFF), Color(0xff123597)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                ),
                Text("Dhaka", style: AppTextStyle.interW700size32),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Image.asset(ImagePath.location),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("Current Location",
                        style: AppTextStyle.interW400size12),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * 0.2,
                      width: Get.width * 0.3,
                      child: Image.asset(ImagePath.cloud),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("13°", style: AppTextStyle.circularW300size122),
                  ],
                ),
                const Text("Partly Cloud -H: 13° L:13°",
                    style: AppTextStyle.circularW400size18),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 32),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white.withOpacity(0.1)),
                      child: Text("Today", style: AppTextStyle.interW400size12),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 32),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xff000000).withOpacity(0.1)),
                      child:
                          Text("Next Day", style: AppTextStyle.interW400size12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: Get.height * 0.2,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child:
                          Container(
                              height: Get.height * 0.2,
                              width: Get.width * 0.2,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white,
                                    Colors.white.withOpacity(0.0)
                                  ],
                                ),
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  const Text("Now",
                                      style: AppTextStyle.circularW400size16),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(ImagePath.cloud),
                                            fit: BoxFit.cover)),
                                  ),
                                  const Text("13°",
                                      style: AppTextStyle.circularW400size16),
                                ],
                              )),
                        );
                      }),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ClipPath(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xff97ABFF), Color(0xff123597)],
                    ),
                  ),
                
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
