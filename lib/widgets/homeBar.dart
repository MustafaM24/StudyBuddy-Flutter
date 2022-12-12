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
  final bool showLeading;
  const HomeBar({
    Key? key,
    this.showLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? currentUser = Provider.of<UserProvider>(context).currentUser;
    return AppBar(
      centerTitle: false,
      elevation: 0.0,
      backgroundColor: const Color(0xFF51546E),
      automaticallyImplyLeading: false,
      leadingWidth: MediaQuery.of(context).size.width * 0.5,
      title: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
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
      actions: getActions(currentUser),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  List<Widget> getActions(User? user) {
    if (user != null) {
      return [
        TextButton(
            onPressed: () => NavigationService.navigatorKey.currentContext!.read<UserProvider>().logout(), child: const Text('Logout', style: TextStyle(color: Colors.white))),
        Padding(
          padding: const EdgeInsets.only(right: 17.0),
          child: CustomAvatar(avatarUrl: user.avatar, size: 35),
        ),
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
