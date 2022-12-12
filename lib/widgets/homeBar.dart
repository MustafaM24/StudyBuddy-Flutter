import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:studybuddy/auth/login.dart';
import 'package:studybuddy/main.dart';
import 'package:studybuddy/models/all_models.dart';
import 'package:studybuddy/provider/user_provider.dart';
import 'package:studybuddy/utils/navigation_service.dart';
import 'package:studybuddy/widgets/custom_avatar.dart';

// cop app bar widget from main.dart
class HomeBar extends StatelessWidget implements PreferredSizeWidget {
  final bool home;
  const HomeBar({
    Key? key,
    this.home = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? currentUser = Provider.of<UserProvider>(context).currentUser;
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: const Color(0xFF51546E),
      automaticallyImplyLeading: false,
      leading: home
          ? IconButton(
              onPressed: () {
                Navigator.of(NavigationService.navigatorKey.currentContext!).pop();
              },
              icon: const Icon(Icons.arrow_back),
            )
          : IconButton(
              onPressed: () => NavigationService.navigatorKey.currentContext!.read<UserProvider>().logout(),
              icon: Icon(Icons.logout, size: 20),
            ),
      title: TextButton(
        onPressed: () {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => MyHomePage()),
          // );
        },
        child: const Text(
          "Study Buddy",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            letterSpacing: 1.1,
          ),
        ),
      ),
      actions: getActions(currentUser),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  List<Widget> getActions(User? user) {
    if (user != null) {
      return [
        CustomAvatar(avatarUrl: user.avatar, size: 35),
        SizedBox(width: 15),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            Navigator.of(NavigationService.navigatorKey.currentContext!).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
          },
          icon: const Icon(Icons.person_rounded),
        ),
      ];
    }
  }
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
