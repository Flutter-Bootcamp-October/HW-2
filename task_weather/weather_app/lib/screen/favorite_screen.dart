import 'package:flutter/material.dart';
import 'package:weather_app/data/global_data.dart';
import 'package:weather_app/widgets/background.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
          child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 24),
                const Text(
                  "Favorite Cities",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
            const SizedBox(height: 40),
            ListView.separated(
              shrinkWrap: true,
              itemCount: favoriteCities.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Text(
                            favoriteCities[index],
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const Icon(Icons.foggy, color: Colors.white)
                        ]),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.white.withOpacity(0.5),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
