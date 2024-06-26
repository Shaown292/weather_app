import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather_response_model.dart';
import 'package:dio/dio.dart';


class HomeController extends GetxController {


  WeatherAPIResponseModel? weatherAPIResponseModel ;
  RxBool isLoading = false.obs ;
  RxBool isLoadingForNextDay = false.obs ;
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  int day = 1;


  void fetchWeatherData(int day) async {
    isLoading.value = true;

    Dio dio = Dio();
    try {
      var response = await dio.get('http://api.weatherapi.com/v1/forecast.json?key=aa0a890cab124a9c80d55654242904&q=London&days=$day&aqi=no&alerts=no');
      if (response.statusCode == 200) {
        isLoading.value = false;
        // Data fetched successfully
        Map<String, dynamic> data = response.data;
        weatherAPIResponseModel = WeatherAPIResponseModel.fromJson(data);

        // Print more weather details as needed
      } else {
        // Handle error
        print('Failed to load weather data: ${response.statusCode}');
        isLoading.value = false;
      }
    } catch (error) {
      // Handle Dio errors
      print('Dio error: $error');
      isLoading.value = false;
    }
  }





  @override
  void onInit() {
    fetchWeatherData(day);
    print("Date $formattedDate");
    super.onInit();
  }

}
