import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather_response_model.dart';
import 'package:dio/dio.dart';


class HomeController extends GetxController {


  WeatherAPIResponseModel? weatherAPIResponseModel ;
  RxBool isLoading = false.obs ;
  RxBool isLoadingForNextDay = false.obs ;
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());


  void fetchWeatherData() async {
    isLoading.value = true;

    Dio dio = Dio();
    try {
      var response = await dio.get('http://api.weatherapi.com/v1/forecast.json?key=aa0a890cab124a9c80d55654242904&q=London&days=1&aqi=no&alerts=no');
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


  void fetchWeatherDataForNextDay() async {
    isLoadingForNextDay.value = true;

    Dio dio = Dio();
    try {
      var response = await dio.get('http://api.weatherapi.com/v1/future.json?key=aa0a890cab124a9c80d55654242904&q=London&dt=2024-05-15');
      if (response.statusCode == 200) {
        isLoadingForNextDay.value = false;
        // Data fetched successfully
        Map<String, dynamic> data = response.data;
        weatherAPIResponseModel = WeatherAPIResponseModel.fromJson(data);

        // Print more weather details as needed
      } else {
        // Handle error
        print('Failed to load weather data: ${response.statusCode}');
        isLoadingForNextDay.value = false;
      }
    } catch (error) {
      // Handle Dio errors
      print('Dio error: $error');
      isLoadingForNextDay.value = false;
    }
  }


  @override
  void onInit() {
    fetchWeatherData();
    print("Date $formattedDate");
    super.onInit();
  }

}
