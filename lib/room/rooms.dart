import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studybuddy/main.dart';
import 'package:studybuddy/models/all_models.dart';
import 'package:studybuddy/provider/data_provider.dart';
import 'package:studybuddy/room/room.dart';
import 'package:studybuddy/widgets/custom_avatar.dart';
import 'package:studybuddy/widgets/homeBar.dart';
import 'package:timeago/timeago.dart' as timeago;

List rooms = [];
// Rooms {
//     name
//     topic
//     about
//     creatoruid
//     creatorname
//     numjoined
//}

class CreateRoom extends StatelessWidget {
  CreateRoom({Key? key}) : super(key: key);

  TextEditingController name = TextEditingController();
  TextEditingController topic = TextEditingController();
  TextEditingController about = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D39),
      // appBar: AppBar(
      //   elevation: 0.0,
      //   centerTitle: true,
      //   title: const Text(
      //     "CREATE STUDY ROOM",
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 15.0,
      //       letterSpacing: 1.1,
      //     ),
      //   ),
      //   backgroundColor: const Color(0xFF696d97),
      // ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const HomeBar(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 35.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "CREATE STUDY ROOM",
                          style: TextStyle(color: Colors.white, fontSize: 20.0, letterSpacing: 1.1),
                          // fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    const Text(
                      "Room Name",
                      style: TextStyle(
                        fontSize: 13.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFb2bdbd),
                      ),
                    ),
                    const SizedBox(
                      height: 8.5,
                    ),
                    SizedBox(
                      height: 45.0,
                      child: TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF71C5DD), width: 1)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "Topic",
                      style: TextStyle(
                        fontSize: 13.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFb2bdbd),
                      ),
                    ),
                    const SizedBox(
                      height: 8.5,
                    ),
                    SizedBox(
                      height: 45.0,
                      child: TextFormField(
                        controller: topic,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF71C5DD), width: 1)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "About Room",
                      style: TextStyle(
                        fontSize: 13.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFb2bdbd),
                      ),
                    ),
                    const SizedBox(
                      height: 8.5,
                    ),
                    SizedBox(
                      height: 100.0,
                      child: TextFormField(
                        controller: about,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF71C5DD), width: 1)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 42,
                          width: 80.0,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shadowColor: Colors.black,
                              backgroundColor: const Color(0xFF696d97),
                              elevation: 3.0,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(fontSize: 14.0, letterSpacing: 1.0, fontWeight: FontWeight.w400, color: Color(0xFFe5e5e5)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        SizedBox(
                          height: 42,
                          width: 120.0,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shadowColor: Colors.black,
                              backgroundColor: const Color(0xFF71C5DD),
                              elevation: 3.0,
                            ),
                            onPressed: () {
                              rooms.add([name.text, topic.text, about.text, "mm05548", "Mustafa Madraswala", 2]);
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MyHomePage()));
                            },
                            child: const Text(
                              "Create Room",
                              style: TextStyle(fontSize: 14.0, letterSpacing: 1.0, fontWeight: FontWeight.w400, color: Color(0xFF3f4156)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final int roomId;

  const RoomCard({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    final Room room = context.read<DataProvider>().rooms.firstWhere((element) => element.id == roomId);
    return Card(
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 23.0),
      color: const Color(0xFF51546e),
      child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              const SizedBox(width: 12.0),
              const Icon(
                Icons.person_rounded,
                color: Color(0xFF71C5DD),
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
            height: 10.0,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // children: [
            //   Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Text(
              //   "Haven't signed up yet?",
              //   style: TextStyle(
              //     color: Color(0xFFb2bdbd),
              //     fontSize: 14.0,
              //   ),
              // ),
              SizedBox(
                height: 35.0,
                width: 130.0,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RoomScreen(index: 0)));
                  },
                  // child: const Text(
                  //   "Sign Up",
                  // child: const Text(
                  // data[0],
                  child: Text(
                    room.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.5,
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
              )
            ],

            // ),
            // ],
          ),

          // actions: [
          //   TextButton(
          //     onPressed: () {
          //       Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(builder: (context) => MyHomePage()),
          //       );
          //     },
          //     child: const Text(
          //       "Study Buddy",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 25.0,
          //         letterSpacing: 1.1,
          //       ),
          //     ),
          //   ),
          // ]

          // children: [
          //   Padding(
          //     padding: const EdgeInsets.fromLTRB(20.0, 6.0, 15.0, 20.0),
          //     child: Text(
          //       data[0],
          //       style: const TextStyle(
          //         fontSize: 18.5,
          //         color: Colors.white,
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //   ),
          // ],
          // ),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}

class RoomCardNew extends StatelessWidget {
  final int roomId;
  const RoomCardNew({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    final Room room = context.read<DataProvider>().rooms.firstWhere((element) => element.id == roomId);
    return Card(
      color: const Color(0xFF51546e),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
          height: 160,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        CustomAvatar(avatarUrl: room.host.avatar, size: 25.0),
                        const SizedBox(
                          width: 9.0,
                        ),
                        Text(
                          "@${room.host.username}",
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF71C5DD),
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      timeago.format(DateTime.parse(room.updatedAt)),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFFb2bdbd),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Text(
                  room.name == " " ? "Untitled Room" : room.name,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.5,
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Divider(
                  color: const Color(0xFFb2bdbd),
                  thickness: 0.5,
                ),
                Chip(
                    label: Text(
                      room.topic.name == " " ? "No Topic" : room.topic.name,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        letterSpacing: 0.6,
                      ),
                    ),
                    backgroundColor: const Color(0xFF2D2D39)),
              ],
            ),
          )),
    );
  }
}
