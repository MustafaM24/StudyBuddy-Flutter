import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:studybuddy/auth/reg.dart';
import 'package:studybuddy/auth/userProfile.dart';
import 'package:studybuddy/main.dart';
import 'package:studybuddy/provider/user_provider.dart';
import 'package:studybuddy/utils/snack_bar_service.dart';
import 'package:studybuddy/widgets/homeBar.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context, listen: true);
    return AbsorbPointer(
      absorbing: provider.isLoading,
      child: Scaffold(
        backgroundColor: const Color(0xFF2D2D39),
        body: SafeArea(
          child: Center(
            child: ListView(
              children: [
                Container(
                  color: const Color.fromARGB(255, 223, 223, 223),
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.08),
                  child: SvgPicture.asset(
                    "assets/study.svg",
                    // color: Color.fromARGB(255, 255, 255, 255),
                    semanticsLabel: 'A red up arrow',
                    height: MediaQuery.of(context).size.height*0.25,
                  ),
                ),
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
                            "LOGIN",
                            style: TextStyle(color: Colors.white, fontSize: 32.0, letterSpacing: 1.1, fontWeight: FontWeight.bold),
                            // fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      const Text(
                        "Username",
                        style: TextStyle(
                          fontSize: 13.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 219, 219, 219),
                        ),
                      ),
                      const SizedBox(
                        height: 8.5,
                      ),
                      Container(
                        height: 45.0,
                        child: TextFormField(
                          controller: username,
                          style: TextStyle(
                            color: Colors.white
                          ),
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF6BB8CF), width: 1)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 13.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 219, 219, 219),
                        ),
                      ),
                      const SizedBox(
                        height: 8.5,
                      ),
                      Container(
                        height: 45.0,
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white
                          ),
                          controller: password,
                          obscureText: true,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF6BB8CF), width: 1)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButton(
                          buttonText: "Log In",
                          isLoading: provider.isLoading,
                          onPressed: () {
                            provider.login(username.text, password.text).then((value) {
                              if (provider.currentUser != null) {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
                              } else {
                                SnackBarService.showWarningSnackBar(context, "Username or password is incorrect");
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final bool isLoading;
  final String buttonText;
  final double width;
  final double height;

  const CustomElevatedButton({Key? key, this.onPressed, this.onLongPress, this.isLoading = false, this.height = 20, this.width = 20, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF6BB8CF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: width,
              height: height,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.background,
                strokeWidth: 3,
              ),
            )
          : Text(buttonText, style: Theme.of(context).textTheme.button?.copyWith(color: Colors.white)),
    );
  }
}
