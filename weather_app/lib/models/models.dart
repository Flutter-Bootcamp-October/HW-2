class Weather {
  Weather({
    required this.location,
    required this.current,
  });

  late final Location location;
  late final Current current;

  Weather.fromJson(Map<String, dynamic> json) {
    location = Location.fromJson(json['location'] ?? {});
    current = Current.fromJson(json['current'] ?? {});
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['location'] = location.toJson();
    _data['current'] = current.toJson();
    return _data;
  }
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  late final String name;
  late final String region;
  late final String country;
  late final double lat;
  late final double lon;
  late final String tzId;
  late final int localtimeEpoch;
  late final String localtime;

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    region = json['region'] ?? '';
    country = json['country'] ?? '';
    lat = json['lat'] ?? 0.0;
    lon = json['lon'] ?? 0.0;
    tzId = json['tz_id'] ?? '';
    localtimeEpoch = json['localtime_epoch'] ?? 0;
    localtime = json['localtime'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['region'] = region;
    _data['country'] = country;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['tz_id'] = tzId;
    _data['localtime_epoch'] = localtimeEpoch;
    _data['localtime'] = localtime;
    return _data;
  }
}

class Current {
  Current({
    required this.tempC,
    required this.feelslikeC,
    required this.isday,
    required this.condition,
  });

  late final double tempC;
  late final double feelslikeC;
  late final int isday;
  late final Condition condition;

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'] ?? 0.0;
    feelslikeC = json['feelslike_c'] ?? 0.0;
    isday = json['is_day'] ?? 0;
    condition = Condition.fromJson(json['condition'] ?? {});
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['temp_c'] = tempC;
    _data['feelslike_c'] = feelslikeC;
    _data['is_day'] = isday;
    _data['condition'] = condition.toJson();
    return _data;
  }
}

class Condition {
  Condition({required this.text, required this.icon, required this.code});

  late final String text;
  late final String icon;
  late final int code;

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'] ?? '';
    icon = json['icon'] ?? '';
    code = json['code'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['icon'] = icon;
    _data['code'] = code;
    return _data;
  }
}
