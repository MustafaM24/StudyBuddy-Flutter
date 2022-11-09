import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy/auth/login.dart';
import 'package:studybuddy/auth/reg.dart';
import 'package:studybuddy/room/rooms.dart';
import 'room/rooms.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D39),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xFF51546e),
              height: 57.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    icon: const Icon(Icons.person_rounded),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF50546F),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 11.0, horizontal: 10.0),
                          margin:
                              const EdgeInsets.fromLTRB(7.0, 22.0, 7.0, 1.0),
                          child: Row(
                            children: const [
                              Icon(Icons.search_rounded, color: Colors.grey),
                              SizedBox(width: 5.0),
                              Text(
                                "Search for posts",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Flexible(
                  //       child: Container(
                  //         width: 140.0,
                  //         height: 34.0,
                  //         decoration: BoxDecoration(
                  //           color: const Color(0xFF2D2D39),
                  //           shape: BoxShape.rectangle,
                  //           border: Border.all(
                  //             color: const Color(0xFF6BB8CF),
                  //             width: 1.0,
                  //           ),
                  //           borderRadius:
                  //               const BorderRadius.all(Radius.circular(20)),
                  //         ),
                  //         child: TextButton(
                  //             onPressed: () {},
                  //             child: const Text(
                  //               "Browse Topic",
                  //               style: TextStyle(
                  //                 color: Color(0xFF6BB8CF),
                  //                 fontSize: 12.5,
                  //                 letterSpacing: 1.0,
                  //               ),
                  //             )),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 8.0),
                  //     Flexible(
                  //       child: Container(
                  //         width: 140.0,
                  //         height: 34.0,
                  //         decoration: BoxDecoration(
                  //           color: const Color(0xFF2D2D39),
                  //           shape: BoxShape.rectangle,
                  //           border: Border.all(
                  //             color: const Color(0xFF6BB8CF),
                  //             width: 1.0,
                  //           ),
                  //           borderRadius:
                  //               const BorderRadius.all(Radius.circular(20)),
                  //         ),
                  //         child: TextButton(
                  //             onPressed: () {},
                  //             child: const Text(
                  //               "Recent Activity",
                  //               style: TextStyle(
                  //                   color: Color(0xFF6BB8CF),
                  //                   fontSize: 12.5,
                  //                   letterSpacing: 1.0),
                  //             )),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 30.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column( 
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "STUDY ROOM",
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 14.5,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "1 Room(s) available",
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 12.0,
                                  color: Color(0xFF696d97),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Container(
                            width: 140,
                            height: 40,
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                elevation: 3.0,
                                backgroundColor: const Color(0xFF71C5DD),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CreateRoom()));
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Color(0xFF3f4156),
                              ),
                              label: const Padding(
                                padding: EdgeInsets.fromLTRB(0, 4.0, 3.0, 4.0),
                                child: Text(
                                  "Create Room",
                                  style: TextStyle(
                                    color: Color(0xFF3f4156),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 1.0),
                child: ListView.builder(
                  itemCount: rooms.length,
                  itemBuilder: (context, i) {
                    return RoomCard(index: i);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}