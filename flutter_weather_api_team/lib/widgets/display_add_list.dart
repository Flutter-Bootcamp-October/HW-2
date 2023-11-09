import 'package:flutter/material.dart';
import 'package:flutter_weather_api/constant/constant.dart';
import 'package:glass/glass.dart';

class DisplayAddList extends StatefulWidget {
  const DisplayAddList({super.key});

  @override
  State<DisplayAddList> createState() => _DisplayAddListState();
}

class _DisplayAddListState extends State<DisplayAddList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: favoritCity.length,
        itemBuilder: (context, index) {
          for (var element in favoritCity) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: InkWell(
                  onTap: () {
                    // final response = await getWeatherData(cityController.text);
                    // final responseAstronomy =
                    //     await getWeatherAstronomy(cityController.text);
                    // // ignore: use_build_context_synchronously
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return CountryWeatherScreen(
                    //     weather: response,
                    //     weatherAstronomy: responseAstronomy,
                    //   );
                    // }));
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(1, 1),
                            blurRadius: 10,
                            spreadRadius: 1)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                element.location!.name!,
                                style:
                                    const TextStyle(color: white, fontSize: 30),
                              ),
                              Text(
                                element.location!.localtime!,
                                style: const TextStyle(color: white),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${element.current!.tempC?.toInt()}',
                                style:
                                    const TextStyle(color: white, fontSize: 50),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 30),
                                child: Text(
                                  'o',
                                  style: TextStyle(color: white, fontSize: 20),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ).asGlass(
                      blurX: 3,
                      blurY: 5,
                      tintColor: Color.fromARGB(21, 255, 255, 255),
                      clipBorderRadius: BorderRadius.circular(20)),
                ));
          }

          setState(() {});
          return null;
        },
      ),
    );
  }
}
