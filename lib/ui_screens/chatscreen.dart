import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> circleAvatar = [
    'assets/online.png',
    'assets/online.png',
    'assets/offline.png',
    'assets/offline.png',
    'assets/online.png',
    'assets/online.png',
    'assets/online.png',
    'assets/offline.png',
    'assets/offline.png',
    'assets/online.png',
  ];
  final List<String> names = [
    'Maya',
    'Nindy',
    'Jaraa',
    'Dinda',
    'Alya',
    'Messi',
    'Rocco',
    'Sasira',
    'Salma',
    'Laurent',
  ];
  final List<String> messageList = [
    'Salma',
    'Cindy',
    'Bella',
    'Laurent',
    'Gabriella',
    'Messi',
    'Rocco',
    'Anastasia',
    'Salma',
    'Sasira,'
  ];
  final List<String> subtitleMessage = [
    'Hello 👋',
    'Hello, nice to meet you too 😊',
    'Typing...',
    'Laurent scheduled a date',
    'Would you mind if we meet  \n somewhere?',
    'The World Is Ours!',
    'Lets go for the hike?',
    'Bye!',
    'Oh no! Really',
    'Fuck it!,'
  ];
  final List<String> timeSent = [
    '5 min ago',
    '08:11 AM',
    '12:11 PM',
    '10:45 AM',
    'Wednesday',
    'Sunday',
    '11:11 AM',
    '09:46 PM',
    'Monday',
    'Tuesday'
  ];

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    final orientationData = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.94),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: orientationData == Orientation.portrait
                  ? deviceData.width / 4.571
                  : deviceData.width / 9.447,
              margin: EdgeInsets.only(
                right: orientationData == Orientation.portrait
                    ? deviceData.width / 1.371
                    : deviceData.width / 1.14,
              ),
              child: const Text(
                'Match',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: orientationData == Orientation.portrait
                  ? deviceData.height / 6.195
                  : deviceData.height / 3.521,
              
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: circleAvatar.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: 90,
                      height: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            circleAvatar[index],
                            scale: 2.5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            names[index],
                            style: const TextStyle(color: Colors.black),
                          )
                        ],
                      ));
                },
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              width: double.infinity,
              height: orientationData == Orientation.portrait
                  ? deviceData.height / 1.489
                  : deviceData.height / 2.653,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    orientationData == Orientation.portrait
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: deviceData.width / 15.571,
                                top: deviceData.width / 15.571),
                            child: const Text(
                              'Message',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                                left: deviceData.width / 60.571,
                                top: deviceData.width / 60.571),
                            child: const Text(
                              'Message',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            print('pressed');
                          });
                        },
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ListTile(
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(timeSent[index]),
                                  SizedBox(height: 5),
                                  index == 1
                                      ? Image.asset(
                                          'assets/pinkdot.jpg',
                                          height: 20,
                                        )
                                      : Text('')
                                ],
                              ),
                              leading: Image.asset(
                                circleAvatar[index],
                                scale: 3,
                              ),
                              title: Row(
                                children: [
                                  Text(messageList[index]),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Text(subtitleMessage[index],
                                      style: TextStyle(
                                          color: index == 2
                                              ? Colors.pink[500]
                                              : Colors.blueGrey)),
                                  index == 0 || index == 4
                                      ? Image.asset(
                                          'assets/check-Jkd-taR.png',
                                          scale: 2,
                                        )
                                      : Text('')
                                ],
                              ),
                            );
                          },
                          itemCount: messageList.length,
                        ),
                      ),
                    ),
                  ]),
            ),
            BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/frame-590.png',
                      height: 24, width: 24, color: Colors.pink[200]),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/frame-591.png',
                      height: 24, width: 24),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/frame-592.png',
                    height: 24,
                    width: 24,
                    color: Colors.pink[200],
                  ),
                  label: '',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
