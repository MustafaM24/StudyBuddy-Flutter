import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studybuddy/models/all_models.dart';
import 'package:studybuddy/provider/room_provider.dart';
import 'package:studybuddy/provider/user_provider.dart';
import 'package:studybuddy/room/rooms.dart';
import 'package:studybuddy/utils/network_util.dart';
import 'package:studybuddy/widgets/chat_message.dart';
import 'package:studybuddy/widgets/homeBar.dart';

class RoomScreen extends StatelessWidget {
  RoomScreen({Key? key, required this.index}) : super(key: key);

  TextEditingController message = TextEditingController();

  final int index;

  Future<List<Message>> getMessages() async {
    List<Message> messages = [];
    try {
      Response response = await NetworkUtil.instance.get('rooms/$index/messages');
      List<dynamic> messagesMap = response.data as List<dynamic>;
      // print(messagesMap);
      rooms = [];
      for (var message in messagesMap) {
        // print(message);
        messages.add(Message.fromMap(message as Map<String, dynamic>));
      }
    } catch (e) {
      print("Error: /$e");
    }
    return messages;
  }

  Future<void> postMessage(String message, User user) async {
    try {
      // make a post request to login
      Response response = await NetworkUtil.instance.post(
        'rooms/$index/messages/',
        data: {
          'message': message,
          'user': {"username": "user"},
        },
        accessToken: user.token,
      );
      // get access token
      Message newMessage = Message.fromMap(response.data as Map<String, dynamic>);
      print(newMessage);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // List data = rooms[index];
    final Room room = context.read<RoomProvider>().rooms.firstWhere((element) => element.id == index);
    TextEditingController newMessageController = TextEditingController();

    return Scaffold(
        backgroundColor: const Color(0xFF51546E),
        body: SafeArea(
          child: Center(
            child: Stack(
              children: [
                ListView(children: [
                  const HomeBar(),
                  const SizedBox(
                    // height: MediaQuery.of(context).size.height * 0.02,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Color(0xFF2D2D39)),
                    ),
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF696d97),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color(0xFF696d97),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          ),
                          height: 40,
                          width: 360,
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.meeting_room,
                              color: Colors.white,
                            ),
                            label: Text(
                              room.name,
                              style: const TextStyle(
                                fontSize: 15.0,
                                letterSpacing: 1.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // add a square box to keep in the background with color and i can add rows in it
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 6.0, 15.0, 20.0),
                          child: Text(
                            room.description,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF6BB8CF),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // add text left side
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 6.0, 15.0, 20.0),
                          child: Text(
                            "HOSTED BY",
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Color(0xFFb2bdbd),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 15.0),
                        const Icon(
                          Icons.person_rounded,
                          color: Color(0xFFb2bdbd),
                          size: 25.0,
                        ),
                        const SizedBox(
                          width: 9.0,
                        ),
                        Text(
                          "@${room.host.username}",
                          style: const TextStyle(
                            color: Color(0xFF71C5DD),
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 6.0, 15.0, 20.0),
                          child: Text(
                            "TOPICS",
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Color(0xFFb2bdbd),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF696d97),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color(0xFF696d97),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          ),
                          height: 25,
                          width: 90,
                          margin: const EdgeInsets.symmetric(horizontal: 20.0),
                          // center the text
                          child: Center(
                            child: Text(
                              room.topic.name,
                              style: const TextStyle(
                                fontSize: 15.0,
                                letterSpacing: 1.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // add text box for topic in the middle center aligned
                    const SizedBox(height: 30.0),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2D2D39),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: const Color(0xFF2D2D39),
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      ),
                      height: 500,
                      width: 360,
                      margin: const EdgeInsets.symmetric(horizontal: 0.0),
                      // center the text on top of container
                      // child: ChatMessage(text: "Sample",)
                      child: FutureBuilder<List<Message>>(
                        future: getMessages(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                              child: SizedBox(height: 25, width: 25, child: CircularProgressIndicator()),
                            );
                          } else if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasError) {
                              return const Text('Error');
                            } else if (snapshot.hasData) {
                              if (snapshot.data!.isNotEmpty) {
                                return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: ((context, index) => ChatMessage(
                                          text: snapshot.data![index].message,
                                          user: snapshot.data![index].user,
                                        )));
                              } else {
                                return const Center(
                                  child: Text(
                                    "No messages",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Color(0xFFb2bdbd),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }
                            } else {
                              return const Text('Empty data');
                            }
                          } else {
                            return Text('State: ${snapshot.connectionState}');
                          }
                        },
                      ),
                    ),
                    // add text input field
                  ]),
                ]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    height: 60,
                    width: 360,
                    color: const Color.fromARGB(255, 19, 19, 24),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: newMessageController,
                            decoration:
                                const InputDecoration(hintText: "Write message...", hintStyle: TextStyle(color: Color.fromARGB(137, 207, 207, 207)), border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        FloatingActionButton(
                          onPressed: () async {
                            if (newMessageController.text.trim() != "") {
                              User current = context.read<UserProvider>().currentUser!;
                              await postMessage(newMessageController.text, current);
                            }
                          },
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                          backgroundColor: const Color(0xFF696d97),
                          elevation: 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
