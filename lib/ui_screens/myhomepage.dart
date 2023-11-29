import 'package:flutter/material.dart';
import 'package:uitask/ui_screens/chatscreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;

    final orientationData = MediaQuery.of(context).orientation;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: buildTopContainer(deviceData, orientationData),
            ),
            buildMainContainer(deviceData, orientationData),
            const SizedBox(
              height: 5,
            ),
            buildBottomNavigationBar(deviceData, orientationData),
          ],
        ),
      ),
    );
  }

  Widget buildTopContainer(Size deviceData, Orientation orientationData) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 5.0),
        width: deviceData.width * 0.95,
        height: orientationData == Orientation.portrait
            ? deviceData.height / 13.1
            : deviceData.height / 6,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(
                  () {
                    print('$deviceData');
                    print('$orientationData');
                  },
                );
              },
              icon: const Icon(
                size: 40,
                Icons.loop,
                color: Colors.black,
              ),
            ),
            Container(
              width: orientationData == Orientation.portrait
                  ? deviceData.width / 3.2
                  : deviceData.width / 3.0,
              height: orientationData == Orientation.portrait
                  ? deviceData.height / 16.2
                  : deviceData.height / 12.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: <Color>[
                    Color(0xfffa5480),
                    Color(0xffe71d54),
                  ],
                ),
              ),
              child: Center(
                child: Text('For You',
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
            Text('Nearby', style: Theme.of(context).textTheme.bodyLarge),
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    print('You got notifications..');
                  },
                );
              },
              child: Image.asset('assets/notifications.png'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMainContainer(Size deviceData, Orientation orientationData) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      padding: EdgeInsets.fromLTRB(
          8,
          orientationData == Orientation.portrait
              ? 440
              : 50 + MediaQuery.of(context).padding.top,
          8 + MediaQuery.of(context).padding.right,
          0),
      width: double.infinity,
      height: orientationData == Orientation.portrait
          ? deviceData.height / 1.332
          : deviceData.height / 1.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          begin: orientationData == Orientation.portrait
              ? const Alignment(-0, -1)
              : const Alignment(-0, -1.3),
          end: const Alignment(0, 1.055),
          colors: const [
            Color(0x000a0a0a),
            Color(0x890a0a0a),
            Color(0xff0a0a0a),
          ],
          stops: const [0.418, 0.698, 1],
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ratna,', style: Theme.of(context).textTheme.titleLarge),
              Text(' 22', style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(
                width: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  'assets/tickmark.png',
                  scale: 2.5,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    print('Favorited..');
                  });
                },
                child: Image.asset(
                  'assets/group-11.png',
                  scale: 3.5,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/vuesax-bold-location-NTo.png',
                scale: 3,
                color: Colors.black45,
              ),
              const SizedBox(
                width: 5,
              ),
              Text('Bekasi - ', style: Theme.of(context).textTheme.bodySmall),
              Text(
                '10 km',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                orientationData == Orientation.portrait
                    ? Positioned(
                        left: deviceData.width / 3.425,
                        bottom: deviceData.height / -28.91,
                        child: SizedBox(
                          width: deviceData.width / 2.285,
                          height: deviceData.height / 4.818,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        print('No Match..');
                                      },
                                    );
                                  },
                                  child: Image.asset('assets/group-19-TNV.png'),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        print('Matched..');
                                      },
                                    );
                                  },
                                  child: Image.asset('assets/group-21.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Positioned(
                        left: deviceData.width / 2.429,
                        bottom: deviceData.height / -38.74,
                        child: SizedBox(
                          width: deviceData.width / 9.447,
                          height: deviceData.height / 5.534,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.asset('assets/group-19-TNV.png'),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 1,
                                child: Image.asset('assets/group-21.png'),
                              ),
                            ],
                          ),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar(
      Size deviceData, Orientation orientationData) {
    return orientationData == Orientation.portrait
        ? Container(
            color: Colors.transparent,
            width: deviceData.width / 1.467,
            height: deviceData.height / 12.39,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        print('Navigating to Profile Dating..');
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/frame-590.png',
                    scale: 2.5,
                    color: Colors.pink[200],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        print('Navigating to Chatscreen..');
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const ChatScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(0.0, -1.0);
                                const end = Offset.zero;
                                const curve = Curves.bounceIn;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            )

                            // MaterialPageRoute(
                            //   builder: (context) => const ChatScreen(),
                            // ),
                            );
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/frame-591.png',
                    scale: 2.5,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        print('Navigating to Userprofile..');
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/frame-592.png',
                    scale: 2.5,
                    color: Colors.pink[200],
                  ),
                ),
              ],
            ),
          )
        : Container(
            color: Colors.transparent,
            width: deviceData.width / 3.032,
            height: deviceData.height / 7.748,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        print('Navigating to Profile Dating..');
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/frame-590.png',
                    scale: 2,
                    color: Colors.pink[200],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        print('Navigating to Chatscreen..');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatScreen(),
                          ),
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/mssg.jpg',
                    scale: 2,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        print('Navigating to Userprofile..');
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/frame-592.png',
                    scale: 2,
                    color: Colors.pink[200],
                  ),
                ),
              ],
            ),
          );
  }
}
