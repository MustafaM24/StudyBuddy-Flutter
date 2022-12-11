import 'package:flutter/material.dart';
import 'package:studybuddy/auth/reg.dart';
import 'package:studybuddy/auth/userProfile.dart';
import 'package:studybuddy/widgets/homeBar.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2D39),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const HomeBar(showLeading: false),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF6BB8CF),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color(0xFF6BB8CF),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          ),
                          height: 40,
                          width: 120,
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.lock_outline_rounded,
                              color: Color(0xFF3f4156),
                            ),
                            label: const Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 13.0,
                                letterSpacing: 1.0,
                                color: Color(0xFF3f4156),
                              ),
                            ),
                          ),
                        ),
                      ],
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
    );
  }
}
