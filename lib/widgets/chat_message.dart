
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key? key, required this.text}) : super(key: key);

  final String text;

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
                          const Icon(
                            Icons.person_rounded,
                            color: Color(0xFFb2bdbd),
                            size: 25.0,
                          ),
                          const SizedBox(
                            width: 9.0,
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
    );
  }
}