
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy/models/all_models.dart';
import 'package:studybuddy/widgets/custom_avatar.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key? key, required this.text, required this.user}) : super(key: key);

  final String text;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20.0),
                          // vertical line
                          Container(
                            height: 30,
                            width: 2,
                            color: const Color(0xFF696d97),
                          ),
                          const SizedBox(width: 20.0),
                          CustomAvatar(avatarUrl: user.avatar, size: 25.0),
                          const SizedBox(
                            width: 9.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "@${user.username}",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 141, 141, 141),
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.8,
                                  fontSize: 10
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                text,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 201, 201, 201),
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
      ],
    );
  }
}