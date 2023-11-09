import 'package:flutter/material.dart';
import 'package:hw2/data/colors.dart';
import 'package:hw2/data/global.dart';
import 'package:hw2/extentions/size_extention.dart';
import 'package:hw2/main.dart';

class WeatherForecastRow extends StatelessWidget {
  const WeatherForecastRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isWeek = false;

    return ClipPath(
      //  clipper: WeatherClip(),
      child: Stack(
        children: [
          Container(
            width: context.getWidth(),
            height: context.getHeight() * .37,
            decoration: BoxDecoration(
              color: Colors.black,
              gradient: LinearGradient(colors: [
                colorsSwatch[1],
                colorsSwatch[6],
                colorsSwatch[2],
                colorsSwatch[1],
              ]),
              borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(94)),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: context.getWidth(),
              height: context.getHeight() * .36,
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(90)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        colorsSwatch[6],
                        colorsSwatch[6],
                        colorsSwatch[6],
                        colorsSwatch[6],
                        colorsSwatch[2],
                      ])),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, top: 16, bottom: 8),
                    child: ListTile(
                      leading: Icon(
                        (isWeek)
                            ? Icons.watch_later_rounded
                            : Icons.calendar_month,
                        color: colorsSwatch[4],
                      ),
                      title: const Text("Forecast"),
                      titleTextStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      textColor: colorsSwatch[4],
                      horizontalTitleGap: 5,
                    ),
                  ),
                  Expanded(
                    child: ValueListenableBuilder<bool>(
                        valueListenable: didChange,
                        builder: (context, value, child) {
                          return ListView.separated(
                              padding: const EdgeInsets.only(left: 16),
                              itemCount: defaultCountry!
                                  .forecast!.forecastday!.first.hour!.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: 16,
                                  ),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final length = defaultCountry!.forecast!
                                    .forecastday![0].hour![index].time!.length;
                                final hour = defaultCountry!.forecast!
                                    .forecastday![0].hour![index].time!
                                    .substring(length - 5);
                                final temp = defaultCountry!.forecast!
                                    .forecastday!.first.hour![index].tempC;
                                final isDay = defaultCountry!.forecast!
                                    .forecastday!.first.hour![index].isDay;
                                return Column(
                                  children: [
                                    Text(
                                      hour,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: colorsSwatch[7],
                                          shadows: [
                                            Shadow(
                                              offset: const Offset(0, 6),
                                              blurRadius: 6.5,
                                              color: colorsSwatch[1],
                                            ),
                                          ]),
                                    ),
                                    const SizedBox(height: 8),
                                    PhysicalModel(
                                      color: colorsSwatch[1],
                                      elevation: 15.0,
                                      shape: BoxShape.circle,
                                      child: CircleAvatar(
                                        backgroundColor: colorsSwatch[4],
                                        radius: 28,
                                        child: CircleAvatar(
                                          backgroundColor: colorsSwatch[5],
                                          radius: 25,
                                          foregroundImage: AssetImage((isDay ==
                                                  1)
                                              ? "assets/images/weather_status/sunny_transparent.png"
                                              : "assets/images/weather_status/night_transparent.png"),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "$temp°",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                );
                              });
                        }),
                  ),
                  // const CustomSwitch(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
