import 'package:flutter/material.dart';

import 'package:studybuddy/auth/login.dart';
import 'package:studybuddy/main.dart';

// cop app bar widget from main.dart
class HomeBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showLeading;
  const HomeBar({
    Key? key,
    this.showLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0.0,
      backgroundColor: Color(0xFF51546E),
      automaticallyImplyLeading: false,
      leadingWidth: MediaQuery.of(context).size.width * 0.5,
      title: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
        child: const Text(
          "Study Buddy",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            letterSpacing: 1.1,
          ),
        ),
      ),
      actions: [
        if (showLeading)
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
            },
            icon: const Icon(Icons.person_rounded),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


// class HomeBar extends StatelessWidget {
//   const HomeBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0.0,
//       centerTitle: true,
//       title: const Text(
//         "STUDYBUDDY",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 15.0,
//           letterSpacing: 1.1,
//         ),
//       ),
//       backgroundColor: const Color(0xFF696d97),
//       actions: [
//         IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Login(),
//               ),
//             );
//           },
//           icon: const Icon(
//             Icons.logout,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
// }
