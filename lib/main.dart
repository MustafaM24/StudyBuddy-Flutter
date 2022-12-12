import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studybuddy/models/all_models.dart';
import 'package:studybuddy/provider/data_provider.dart';
import 'package:studybuddy/room/room.dart';
import 'package:studybuddy/room/rooms.dart';
import 'package:studybuddy/utils/navigation_service.dart';
import 'package:studybuddy/widgets/homeBar.dart';
import 'package:studybuddy/widgets/room_card.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => DataProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      title: 'Studdy Buddy',
      home: const MyHomePage(),
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
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1), () async {
      Provider.of<DataProvider>(context, listen: false).getRooms();
    });
  }

  @override
  Widget build(BuildContext context) {
    DataProvider provider = Provider.of<DataProvider>(context, listen: true);
    if (provider.isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFF2D2D39),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D39),
      appBar: const HomeBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
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
                          padding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0),
                          margin: const EdgeInsets.fromLTRB(7.0, 22.0, 7.0, 1.0),
                          // create a search bar to search for rooms
                          child: Row(
                            children: const [
                              Icon(Icons.search_rounded, color: Colors.grey),
                              SizedBox(width: 5.0),
                              Text(
                                "Search for posts/rooms",
                                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300, letterSpacing: 1.0),
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
                  const SizedBox(height: 30.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "STUDY ROOM",
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 14.5,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              "${provider.rooms.length} Room(s) available",
                              style: const TextStyle(letterSpacing: 1.0, fontSize: 12.0, color: Color(0xFF696d97), fontWeight: FontWeight.w500),
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateRoom()));
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
            const SizedBox(height: 20.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 1.0),
                child: ListView.builder(
                  itemCount: provider.rooms.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RoomScreen(index: provider.rooms[i].id)),
                        );
                      },
                      child: RoomCard(roomId: provider.rooms[i].id));
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
