class Weather {
  Location? location;
  Current? current;

  Weather({this.location, this.current});

  Weather.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzId,
      this.localtimeEpoch,
      this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['region'] = this.region;
    data['country'] = this.country;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['tz_id'] = this.tzId;
    data['localtime_epoch'] = this.localtimeEpoch;
    data['localtime'] = this.localtime;
    return data;
  }
}

class Current {
  Current(
      {required this.tempC,
      required this.feelslikeC,
      required this.isday,
      required this.condition,
      required this.windSpeed,
      required this.windDir,
      required this.Humidity,
      required this.visibility,
      required this.uv,
      required this.tempf,
      required this.pressureMb});

  late final double tempC;
  late final double feelslikeC;
  late final int isday;
  late final Condition condition;
  late final double windSpeed;
  late final String windDir;
  late final int Humidity;
  late final double visibility;
  late final double uv;
  late final double tempf;
  late final double pressureMb;
  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'] ?? 0.0;
    tempf = json['temp_f'] ?? 0.0;
    feelslikeC = json['feelslike_c'] ?? 0.0;
    isday = json['is_day'] ?? 0;
    windSpeed = json['wind_kph'] ?? 0.0;
    windDir = json['wind_dir'] ?? '';
    Humidity = json['humidity'] ?? 0;
    visibility = json['vis_km'] ?? 0.0;
    uv = json['uv'] ?? 0.0;
    pressureMb = json['pressure_mb'];

    condition = Condition.fromJson(json['condition'] ?? {});
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['temp_c'] = tempC;
    _data['feelslike_c'] = feelslikeC;
    _data['is_day'] = isday;
    _data['temp_f'] = tempf;
    _data['wind_kph'] = windSpeed;
    _data['wind_dir'] = windDir;
    _data['humidity'] = Humidity;
    _data['vis_km'] = visibility;
    _data['uv'] = uv;
    _data['pressure_mb'] = pressureMb;
    _data['condition'] = condition.toJson();
    return _data;
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['code'] = this.code;
    return data;
  }
}
