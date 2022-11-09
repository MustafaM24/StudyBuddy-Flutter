import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy/main.dart';


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
      backgroundColor: const Color(0xFF3f4156),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "CREATE STUDY ROOM",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            letterSpacing: 1.1,
          ),
        ),
        backgroundColor: const Color(0xFF696d97),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Container(
                      height: 45.0,
                      child: TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF696d97), width: 1)),
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
                    Container(
                      height: 45.0,
                      child: TextFormField(
                        controller: topic,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF696d97), width: 1)),
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
                    Container(
                      height: 100.0,
                      child: TextFormField(
                        controller: about,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF696d97), width: 1)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
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
                              style: TextStyle(
                                  fontSize: 14.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFe5e5e5)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Container(
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
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => const MyHomePage())
                              );
                            },
                            child: const Text(
                              "Create Room",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF3f4156)),
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
  RoomCard({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final List data = rooms[index];

    return Card(
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 23.0),
      color: const Color(0xFF51546e),
      child: Column(
        children: [
          const SizedBox(height: 10.0,),
          Row(
            children: [
              const SizedBox(width: 12.0),
              const Icon(Icons.person_rounded, color: Colors.blue, size: 30.0,),
              const SizedBox(width: 9.0,),
              Text("@${data[3]}",
                style: const TextStyle(
                  color: Color(0xFF71C5DD),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 6.0, 15.0, 20.0),
                child: Text(data[0],
                  style: const TextStyle(
                    fontSize: 18.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              thickness: 1,
              color: Color(0xFF696d97),
            ),
          )

        ],
      ),
    );
  }
}
