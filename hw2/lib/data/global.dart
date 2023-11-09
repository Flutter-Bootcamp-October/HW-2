import 'package:flutter/cupertino.dart';
import 'package:hw2/models/weather_model.dart';

ValueNotifier<List<Weather>> listOfCountries = ValueNotifier([]);
ValueNotifier<bool> didChange = ValueNotifier(false);
