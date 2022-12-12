import 'package:flutter/material.dart';
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
                            style: TextStyle(color: Colors.white, fontSize: 25.0, letterSpacing: 1.1),
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
                          controller: username,
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
                          controller: password,
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
                            provider.login("testing", "35442326google123\$ABCD").then((value) {
                              if (provider.currentUser != null) {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
                              } else {
                                SnackBarService.showWarningSnackBar(context, "Username or password is incorrect");
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Haven't signed up yet?",
                                style: TextStyle(
                                  color: Color(0xFFb2bdbd),
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(
                                height: 35.0,
                                width: 130.0,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Register()));
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Color(0xFF6BB8CF),
                                      fontSize: 14.0,
                                      letterSpacing: 0.6,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "redirect to user profile",
                                style: TextStyle(
                                  color: Color(0xFFb2bdbd),
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(
                                height: 35.0,
                                width: 130.0,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
                                  },
                                  child: const Text(
                                    "Profile",
                                    style: TextStyle(
                                      color: Color(0xFF6BB8CF),
                                      fontSize: 14.0,
                                      letterSpacing: 0.6,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
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
