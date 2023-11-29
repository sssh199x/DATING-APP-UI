import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  final List<String> circleAvatar;
  final List<String> messageList;
  final List<String> subtitleMessage;
  final List<String> timeSent;

  const MessageContainer({super.key, 
    required this.circleAvatar,
    required this.messageList,
    required this.subtitleMessage,
    required this.timeSent,
  });

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    final orientationData = MediaQuery.of(context).orientation;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
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
                print('pressed');
              },
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(timeSent[index]),
                        const SizedBox(height: 5),
                        index == 1
                            ? Image.asset(
                                'assets/pinkdot.jpg',
                                height: 20,
                              )
                            : const Text('')
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
                            : const Text('')
                      ],
                    ),
                  );
                },
                itemCount: messageList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}