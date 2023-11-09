class Weather {
  Location? location;
  Current? current;
  Forecast? forecast;

  Weather({this.location, this.current, this.forecast});

  Weather.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    forecast =
        json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (forecast != null) {
      data['forecast'] = forecast!.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  String? localtime;

  Location({this.name, this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['localtime'] = localtime;
    return data;
  }
}

class Current {
  double? tempC;
  int? isDay;
  Condition? condition;
  int? humidity;

  Current({this.tempC, this.isDay, this.condition, this.humidity});

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp_c'] = tempC;
    data['is_day'] = isDay;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    data['humidity'] = humidity;
    return data;
  }
}

class Condition {
  String? text;

  Condition({this.text});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    return data;
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(Forecastday.fromJson(v));
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

class Forecastday {
  String? date;
  List<Hour>? hour;

  Forecastday({this.date, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (hour != null) {
      data['hour'] = hour!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hour {
  String? time;
  double? tempC;
  int? isDay;
  int? humidity;

  Hour({this.time, this.tempC, this.isDay, this.humidity});

  Hour.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    tempC = json['temp_c'];
    isDay = json['is_day'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temp_c'] = tempC;
    data['is_day'] = isDay;
    data['humidity'] = humidity;
    return data;
  }
}
