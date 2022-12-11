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
