import 'dart:ui';

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
          // Full Screen Measurements for Sizing Purposes
          Container(
            height: sHeight,
            width: sWidth,
            // Home Page
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // Stories
                  Container(
                    height: sHeight * 0.15,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // Add Story
                          Container(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 10, left: 15, right: 15),
                                  child: Column(
                                    children: [
                                      ClipOval(
                                        child: Container(
                                          padding: EdgeInsets.all(0.4),
                                          decoration:
                                              BoxDecoration(color: Colors.grey),
                                          child: ClipOval(
                                            child: Image.asset(
                                              "assets/images/pfp/profile_picture.jpg",
                                              height: sHeight * 0.1,
                                              width: sHeight * 0.1,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: sHeight * 0.0145,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 27,
                                  child: ClipOval(
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.red,
                                            Colors.purple,
                                            Colors.pink,
                                            Colors.yellow,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: iconSize * 0.9,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Friends Stories
                          Row(
                            children: List.generate(5, (i) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 10, right: 15),
                                child: Column(
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.red,
                                              Colors.purple,
                                              Colors.pink,
                                              Colors.yellow,
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                        ),
                                        child: ClipOval(
                                          child: Image.asset(
                                            "assets/images/pfp/ana_pfp.jpg",
                                            height: sHeight * 0.1,
                                            width: sHeight * 0.1,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "ana_p_1206",
                                      style: TextStyle(
                                        fontSize: sHeight * 0.0145,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text("posts"),
                  SizedBox(
                    height: sHeight * 0.095,
                  ),
                ],
              ),
            ),
          ),
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
                        flex: 4,
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                                    colors: [
                                  Colors.red,
                                  Colors.purple,
                                  Colors.pink,
                                  Colors.yellow,
                                ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight)
                                .createShader(bounds);
                          },
                          child: SvgPicture.asset(
                            "assets/images/home.svg",
                            color: Colors.white,
                            height: iconSize,
                          ),
                        )),

                    // Search
                    Expanded(
                      flex: 4,
                      child: SvgPicture.asset(
                        "assets/images/search1.svg",
                        color: Colors.white38,
                      ),
                    ),

                    // Logo Camera
                    Expanded(
                      flex: 5,
                      child: Container(),
                    ),

                    // Notifications
                    Expanded(
                      flex: 4,
                      child: SvgPicture.asset(
                        "assets/images/notifications.svg",
                        color: Colors.white38,
                        height: iconSize,
                      ),
                    ),

                    // Profile
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Container(
                          height: iconSize * 1.6,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/pfp/profile_picture.jpg",
                              fit: BoxFit.fitHeight,
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
