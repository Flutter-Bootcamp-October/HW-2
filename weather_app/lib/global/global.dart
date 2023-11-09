import 'package:weather_app/models/weather_model.dart';

Weather currentCity = Weather.fromJson({
  "location": {
    "name": "Riyadh",
    "region": "Ar Riyad",
    "country": "Saudi Arabia",
    "lat": 24.64,
    "lon": 46.77,
    "tz_id": "Asia/Riyadh",
    "localtime_epoch": 1699443883,
    "localtime": "2023-11-08 14:44"
  },
  "current": {
    "last_updated_epoch": 1699443000,
    "last_updated": "2023-11-08 14:30",
    "temp_c": 30.0,
    "temp_f": 86.0,
    "is_day": 0,
    "condition": {
      "text": "Sunny",
      "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
      "code": 1000
    },
    "wind_mph": 12.5,
    "wind_kph": 20.2,
    "wind_degree": 350,
    "wind_dir": "N",
    "pressure_mb": 1018.0,
    "pressure_in": 30.06,
    "precip_mm": 0.0,
    "precip_in": 0.0,
    "humidity": 18,
    "cloud": 0,
    "feelslike_c": 27.8,
    "feelslike_f": 82.0,
    "vis_km": 10.0,
    "vis_miles": 6.0,
    "uv": 7.0,
    "gust_mph": 10.0,
    "gust_kph": 16.2
  }
});
List<Weather> weatherList = [];//london, riyadh , jubial
