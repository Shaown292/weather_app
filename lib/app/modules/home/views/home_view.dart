import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/home/widget/clipPath.dart';
import 'package:weather_app/constant/image_path/imagePath.dart';
import 'package:weather_app/constant/textStyle.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff97ABFF), Color(0xff123597)],
            ),
          ),
          child: Obx(
                () =>
            controller.isLoading.value
                ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),)
                : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      Text(
                          controller.weatherAPIResponseModel?.location
                              ?.name ??
                              "",
                          style: AppTextStyle.interW700size32),
                      SizedBox(
                        height: Get.height * 0.01,
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
                          Container(
                            height: Get.height * 0.12,
                            width: Get.width * 0.3,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage("https:${controller
                                        .weatherAPIResponseModel?.current
                                        ?.condition?.icon ?? "" }"),
                                    fit: BoxFit.contain)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                              "${controller.weatherAPIResponseModel?.current
                                  ?.tempC ?? ""}°",
                              style: AppTextStyle.circularW300size122),
                        ],
                      ),
                      Text(
                          "${controller.weatherAPIResponseModel?.current
                              ?.condition?.text ?? ""}  -H: ${controller
                              .weatherAPIResponseModel?.forecast
                              ?.forecastday![0].day?.maxTempC}° L:${controller
                              .weatherAPIResponseModel?.forecast
                              ?.forecastday![0].day?.mintempC}°",
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
                            child: Text("Today",
                                style: AppTextStyle.interW400size12),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              controller.isLoadingForNextDay.value ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blueAccent,
                                ),) : controller.fetchWeatherData(controller.day= controller.day + 1);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 32),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: const Color(0xff000000)
                                      .withOpacity(0.1)),
                              child: Text("Next Day",
                                  style: AppTextStyle.interW400size12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: Get.height * 0.18,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.weatherAPIResponseModel
                                ?.forecast?.forecastday![0].hour?.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              String time = controller
                                  .weatherAPIResponseModel
                                  ?.forecast
                                  ?.forecastday![0]
                                  .hour![index]
                                  .time ??
                                  "";
                              String onlyTime =
                              time.replaceRange(0, 10, "");
                              String icon = controller
                                  .weatherAPIResponseModel
                                  ?.forecast
                                  ?.forecastday![0]
                                  .hour![index]
                                  .condition?.icon ??
                                  "";
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0),
                                child: Container(
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
                                      color:
                                      Colors.white.withOpacity(0.5),
                                      borderRadius:
                                      BorderRadius.circular(100),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(onlyTime,
                                            style: AppTextStyle
                                                .circularW400size15),
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "https:$icon"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Text("${controller
                                            .weatherAPIResponseModel?.forecast
                                            ?.forecastday![0].hour![index]
                                            .tempC ??
                                            ""}°",
                                            style: AppTextStyle
                                                .circularW400size15),
                                      ],
                                    )),
                              );
                            }),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.35,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipPath(
                          clipper: CustomClipPath(),
                          child: Container(
                            height: Get.height * 0.3,
                            width: Get.width,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xff97ABFF),
                                  Color(0xff123597)
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    height: Get.height * 0.1,
                                    width: Get.width * 0.85,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xff97ABFF),
                                          Color(0xff123597)
                                        ],
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 56,
                                          width: 56,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      ImagePath
                                                          .sunFogBottomNav),
                                                  fit: BoxFit.contain)),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            const Text("Sunrise",
                                                style: AppTextStyle
                                                    .circularW400size15),
                                            Text(controller
                                                .weatherAPIResponseModel
                                                ?.forecast?.forecastday![0]
                                                .astro?.sunrise ?? "",
                                                style: AppTextStyle
                                                    .circularW400size24),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            const Text("Sunset",
                                                style: AppTextStyle
                                                    .circularW400size15),
                                            Text(controller
                                                .weatherAPIResponseModel
                                                ?.forecast?.forecastday![0]
                                                .astro?.sunset ?? "",
                                                style: AppTextStyle
                                                    .circularW400size24),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: Get.height * 0.1,
                                    width: Get.width * 0.85,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 8),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xff97ABFF),
                                          Color(0xff123597)
                                        ],
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 56,
                                          width: 56,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      ImagePath
                                                          .sunLowBottomNav),
                                                  fit: BoxFit.contain)),
                                        ),
                                        const SizedBox(width: 30,),
                                        const Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("UV Index",
                                                style: AppTextStyle
                                                    .circularW500size16),
                                            Text("Low",
                                                style: AppTextStyle
                                                    .circularW500size24),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: Get.width * 0.35,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xff97ABFF),
                                          Color(0xff123597)
                                        ],
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      alignment: Alignment.bottomCenter,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  ImagePath.vector))),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
