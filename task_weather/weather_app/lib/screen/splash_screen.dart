import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                Color(0xff1e264a),
                Color(0xff3b3781),
                Color(0xff6449aa),
                Color(0xff7f50ae),
                Color(0xff9047ac),
              ])),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/cloudImage.png',
                  width: 428,
                  height: 428,
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Column(children: [
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
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffDDB130),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 15.0,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Get Start',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff1e264a),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          )),
    );
  }
}
