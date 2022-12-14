import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studybuddy/models/all_models.dart';
import 'package:studybuddy/room/room.dart';
import 'package:studybuddy/auth/login.dart';
import 'package:studybuddy/models/all_models.dart';
import 'package:studybuddy/provider/room_provider.dart';
import 'package:studybuddy/provider/user_provider.dart';
import 'package:studybuddy/room/rooms.dart';
import 'package:studybuddy/utils/navigation_service.dart';
import 'package:studybuddy/widgets/homeBar.dart';
import 'package:studybuddy/widgets/room_card.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => RoomProvider()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Studdy Buddy',
      home: const SpashScreen(),
    );
  }
}

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      context.read<UserProvider>().checkAlreadyLoggedIn().then((value) {
        if (context.read<UserProvider>().currentUser == null) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFF2D2D39),
        body: Center(
            child: SizedBox(
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
            child: LogoAnimation(),
          ),
        )));
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
      Provider.of<RoomProvider>(context, listen: false).getRooms();
    });
  }

  @override
  Widget build(BuildContext context) {
    RoomProvider provider = Provider.of<RoomProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D39),
      appBar: const HomeBar(),
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                provider.getRooms();
                return;
              },
              child: SafeArea(
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
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF50546F),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      boxShadow: [BoxShadow(color: Color(0xFF71C5DD), offset: Offset(0, 0), spreadRadius: 1, blurRadius: 6)]),
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  margin: const EdgeInsets.fromLTRB(7.0, 22.0, 7.0, 1.0),
                                  // create a search bar to search for rooms
                                  child: TextField(
                                    onChanged: (value) => provider.setFilter(value),
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      // contentPadding: EdgeInsets.only(top: 0.02),
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: Color.fromARGB(255, 205, 205, 205)),
                                      hintText: "Search for rooms",
                                      focusColor: Colors.transparent,
                                      icon: Icon(
                                        Icons.search,
                                        color: Color(0xFF71C5DD),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const SizedBox(height: 10.0),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 7.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "STUDY ROOMS",
                                      style: TextStyle(
                                        letterSpacing: 1.0,
                                        fontSize: 14.5,
                                        color: Colors.white,
                                      ),
                                    ),
                                    // const SizedBox(height: 5.0),
                                  ],
                                ),
                                Text(
                                  "${provider.rooms.length} Room(s) available",
                                  style: const TextStyle(letterSpacing: 1.0, fontSize: 12.0, color: Color(0xFF696d97), fontWeight: FontWeight.w500),
                                ),
                                // Flexible(
                                //   child: Container(
                                //     width: 140,
                                //     height: 40,
                                //     child: TextButton.icon(
                                //       style: TextButton.styleFrom(
                                //         elevation: 3.0,
                                //         backgroundColor: const Color(0xFF71C5DD),
                                //       ),
                                //       onPressed: () {
                                //         Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateRoom()));
                                //       },
                                //       icon: const Icon(
                                //         Icons.add,
                                //         color: Color(0xFF3f4156),
                                //       ),
                                //       label: const Padding(
                                //         padding: EdgeInsets.fromLTRB(0, 4.0, 3.0, 4.0),
                                //         child: Text(
                                //           "Create Room",
                                //           style: TextStyle(
                                //             color: Color(0xFF3f4156),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: provider.rooms.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RoomScreen(index: provider.rooms[i].id)));
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
                                child: RoomCard(roomId: provider.rooms[i].id),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class LogoAnimation extends StatelessWidget {
  const LogoAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "logo",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Study"),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Buddy'),
              TypewriterAnimatedText('Pal'),
              TypewriterAnimatedText('Mate'),
            ],
          ),
        ],
      ),
    );
  }
}
