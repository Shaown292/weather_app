class NextDayWeatherResponseModel {

  Forecast? forecast;

  NextDayWeatherResponseModel({this.forecast});

  NextDayWeatherResponseModel.fromJson(Map<String, dynamic> json) {

    forecast = json['forecast'] != null
        ? Forecast.fromJson(json['forecast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    if (forecast != null) {
      data['forecast'] = forecast!.toJson();
    }
    return data;
  }
}



class Forecast {
  List<ForecastDayForNextDay>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <ForecastDayForNextDay>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(ForecastDayForNextDay.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (forecastday != null) {
      data['forecastday'] = forecastday!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class ForecastDayForNextDay {
  List<Hour>? hour;

  ForecastDayForNextDay({this.hour});

  ForecastDayForNextDay.fromJson(Map<String, dynamic> json) {

    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (hour != null) {
      data['hour'] = hour?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class ConditionForNextDay {
  String? text;
  String? icon;
  int? code;

  ConditionForNextDay({this.text, this.icon, this.code});

  ConditionForNextDay.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}



class Hour {

  ConditionForNextDay? condition;


  Hour(
      {
        this.condition,
        });

  Hour.fromJson(Map<String, dynamic> json) {

    condition = json['condition'] != null
        ? ConditionForNextDay.fromJson(json['condition'])
        : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (condition != null) {
      data['condition'] = condition!.toJson();
    }

    return data;
  }
}
