import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    double iconSize = sHeight * 0.025;

    return Scaffold(
      backgroundColor: Color.fromRGBO(15, 15, 15, 1),

      // AppBar
      appBar: AppBar(
          toolbarHeight: sHeight * 0.09,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,

          // Instagram Logo
          title: Container(
            padding: EdgeInsets.all(8),
            child: Image.asset(
              "assets/images/instagram_name.png",
              height: sHeight * 0.06,
            ),
          ),

          // Messages Icon
          actions: [
            SvgPicture.asset(
              "assets/images/messages.svg",
              color: Colors.white54,
              height: iconSize,
            ),
            SizedBox(
              width: 20,
            )
          ]),

      // Body
      body: Stack(
        children: [
          // Bottom Navigation Bar
          Positioned(
            bottom: sHeight * 0.02,
            child: Container(
              alignment: Alignment.center,
              width: sWidth,
              child: Container(
                width: sWidth * 0.9,
                height: sHeight * 0.07,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(25, 25, 25, 1.0),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    // Home
                    Expanded(
                      flex: 3,
                      child: SvgPicture.asset(
                        "assets/images/home.svg",
                        color: Colors.white38,
                      ),
                    ),

                    // Search
                    Expanded(
                      flex: 3,
                      child: SvgPicture.asset(
                        "assets/images/search.svg",
                        color: Colors.white38,
                      ),
                    ),

                    // Logo Camera
                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),

                    // Notifications
                    Expanded(
                      flex: 3,
                      child: SvgPicture.asset(
                        "assets/images/notifications.svg",
                        color: Colors.white38,
                      ),
                    ),

                    // Profile
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Container(
                          width: 30,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/profile_picture.jpg",
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Camera Logo
          Positioned(
            bottom: sHeight * 0.028,
            child: Container(
              width: sWidth,
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/instagram_logo.png",
                height: iconSize * 4.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
