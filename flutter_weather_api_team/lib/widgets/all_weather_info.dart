import 'package:flutter/material.dart';
import 'package:flutter_weather_api/constant/constant.dart';
import 'package:flutter_weather_api/models/astronomy.dart';
import 'package:flutter_weather_api/models/weather_model.dart';
import 'package:flutter_weather_api/pages/search_screen.dart';
import 'package:flutter_weather_api/widgets/city_name.dart';
import 'package:flutter_weather_api/widgets/country_name_and_date.dart';
import 'package:flutter_weather_api/widgets/line_widget.dart';
import 'package:flutter_weather_api/widgets/state_weather.dart';
import 'package:flutter_weather_api/widgets/temp_dgree.dart';
import 'package:flutter_weather_api/widgets/container_info.dart';
import 'package:flutter_weather_api/widgets/welcome_text.dart';

class AllWeatherInfo extends StatefulWidget {
  const AllWeatherInfo(
      {super.key,
      required this.weather,
      required this.weatherAstronomy,
      required this.themeColor,
      required this.firstGradient,
      required this.secondGradient});
  final Weather weather;
  final WeatherAstronomy weatherAstronomy;
  final Color themeColor;
  final Color firstGradient;
  final Color secondGradient;

  @override
  State<AllWeatherInfo> createState() => _AllWeatherInfoState();
}

class _AllWeatherInfoState extends State<AllWeatherInfo> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //------------------------ Background Color ------------------------------
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [widget.firstGradient, widget.secondGradient],
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft),
          ),
        ),

        Positioned(
          left: 330,
          child: IconButton(
              onPressed: () {
                // if(widget.weather.location!.name = favoritCity.){}
                favoritCity.add(widget.weather);
                //print(favoritCity);
                setState(() {});
                print(widget.weather.location!.name);
              },
              icon: Icon(
                Icons.favorite_outline_rounded,
                size: 40,
                color: widget.themeColor,
              )),
        ),
        Positioned(
          child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchScreen();
                }));
                setState(() {});
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 40,
                color: widget.themeColor,
              )),
        ),

        //---------------------- Information Weather -----------------------------
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CityName(
                weather: widget.weather,
                textColor: widget.themeColor,
              ),
              height10,
              CountryNameAndDate(
                weather: widget.weather,
                textColor: widget.themeColor,
              ),
              height50,
              height50,
              height50,
              height20,
              height10,
              height10,
              height50,
              TempDegree(
                fonttempSize: 80,
                fontOSize: 20,
                fontCSize: 70,
                weather: widget.weather,
                textColor: widget.themeColor,
              ),
              WelcomeText(
                welcomeText: 'Good Morning',
                textColor: widget.themeColor,
              ),
              StateWeather(
                weather: widget.weather,
                textColor: widget.themeColor,
              ),
              height50,
              height10,
              LineWidget(
                heightLine: 1,
                widthLine: 35,
                colorLine: widget.themeColor,
              ),
              height30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerInfo(
                      text: 'SUNRISE',
                      imageIcon: "assets/sunrise.png",
                      textColor: widget.themeColor,
                      iconColor: widget.themeColor,
                      textObj:
                          widget.weatherAstronomy.astronomy!.astro!.sunrise!),
                  LineWidget(
                    heightLine: 35,
                    widthLine: 1,
                    colorLine: widget.themeColor,
                  ),
                  ContainerInfo(
                      text: 'TEMPRATURE',
                      imageIcon: "assets/thermometer.png",
                      textColor: widget.themeColor,
                      iconColor: widget.themeColor,
                      textObj: '${widget.weather.current!.tempF.toString()} F'),
                  LineWidget(
                    heightLine: 35,
                    widthLine: 1,
                    colorLine: widget.themeColor,
                  ),
                  ContainerInfo(
                      text: 'WIND',
                      imageIcon: "assets/wind.png",
                      textColor: widget.themeColor,
                      iconColor: widget.themeColor,
                      textObj:
                          '${widget.weather.current!.windMph.toString()} m/h'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
