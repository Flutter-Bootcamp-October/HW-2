import 'package:flutter/material.dart';
import 'package:weather_app/screen/home_screen.dart';
import 'package:weather_app/widgets/background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            Image.asset(
              'assets/images/cloudImage.png',
              width: 428,
              height: 428,
            ),
            const Text(
              'Weather',
              style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              'ForeCasts',
              style: TextStyle(fontSize: 64, color: Color(0xffDDB130)),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffDDB130),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 15.0,
                ),
                child: const Text(
                  'Get Start',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff1e264a),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
