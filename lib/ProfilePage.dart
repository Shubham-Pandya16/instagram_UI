import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_ui/data.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    double iconSize = sHeight * 0.025;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: sHeight * 0.09,
          surfaceTintColor: Colors.transparent,

          backgroundColor: const Color.fromARGB(255, 10, 10, 10),

          // Back Button
          leading: Padding(
            padding: EdgeInsets.all(sHeight * 0.02),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: iconSize,
                color: Colors.grey.shade500,
              ),
            ),
          ),

          // Instagram Logo
          centerTitle: true,
          title: Container(
            padding: EdgeInsets.only(top: sHeight * 0.02),
            child: Image.asset(
              "assets/images/instagram_name.png",
              height: sHeight * 0.06,
            ),
          ),

          // Settings
          actions: [
            Padding(
              padding: EdgeInsets.all(sHeight * 0.015),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: iconSize,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ],
        ),

        // Profile
        body:

            // Pull - to - Refresh
            LiquidPullToRefresh(
          onRefresh: () {
            return Future.delayed(Durations.extralong1);
          },
          animSpeedFactor: 2,
          showChildOpacityTransition: true,
          color: Colors.transparent,
          backgroundColor: Color.fromARGB(255, 142, 19, 60),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: sWidth,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 10, 10, 10),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Column(children: [
                    SizedBox(height: sHeight * 0.03),
                    // Profile Picture
                    ClipOval(
                      child: Container(
                        padding: EdgeInsets.all(sHeight * 0.002),
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
                            "assets/images/pfp/profile_picture.jpg",
                            height: sHeight * 0.15,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: sHeight * 0.02),
                    // Name
                    Text(
                      "Shubham Pandya",
                      style: TextStyle(
                          fontSize: sHeight * 0.025,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(200, 255, 255, 255),
                          letterSpacing: 0.1),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Username
                    Text(
                      "@shubham_p.16",
                      style: TextStyle(
                          fontSize: sHeight * 0.019,
                          color: Colors.white54,
                          height: 0.9),
                    ),
                    SizedBox(height: sHeight * 0.03),

                    // Profile Followers, Following, Posts
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Post
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  posts.length.toString(),
                                  style: TextStyle(
                                    fontSize: sHeight * 0.02,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  "Posts",
                                  style: TextStyle(
                                    fontSize: sHeight * 0.018,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text(
                                  "550",
                                  style: TextStyle(
                                    fontSize: sHeight * 0.02,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  "Followers",
                                  style: TextStyle(
                                    fontSize: sHeight * 0.018,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text(
                                  "580",
                                  style: TextStyle(
                                    fontSize: sHeight * 0.02,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  "Followers",
                                  style: TextStyle(
                                    fontSize: sHeight * 0.018,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),

                    // Edit Profile
                    Padding(
                      padding: EdgeInsets.all(sHeight * 0.025),
                      child: Container(
                        width: sWidth * 0.85,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(color: Colors.grey.shade400),
                            )),
                      ),
                    ),
                  ]),
                ),
                Container(
                  height: sHeight,
                  child: Column(
                    children: [
                      TabBar(
                        unselectedLabelColor: Colors.grey.shade700,
                        controller: tabController,
                        dividerColor: Colors.transparent,
                        indicatorColor: Colors.purple,
                        indicatorWeight: 0.1,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 40),
                        labelStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 15),
                        tabs: [
                          Tab(
                            text: "Posts",
                          ),
                          Tab(
                            text: "Reels",
                          )
                        ],
                      ),
                      SizedBox(
                        height: sHeight * 0.01,
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemCount: posts.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      posts[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
