import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studybuddy/models/all_models.dart';
import 'package:studybuddy/provider/room_provider.dart';
import 'package:studybuddy/widgets/custom_avatar.dart';
import 'package:timeago/timeago.dart' as timeago;

class RoomCard extends StatelessWidget {
  final int roomId;
  const RoomCard({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    final Room room = context.read<RoomProvider>().rooms.firstWhere((element) => element.id == roomId);
    return Card(
      elevation: 15,
      shadowColor: Color.fromARGB(255, 0, 0, 0),
      color: const Color(0xFF51546e),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
          height: 160,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        CustomAvatar(avatarUrl: room.host.avatar, size: 25.0),
                        const SizedBox(
                          width: 9.0,
                        ),
                        Text(
                          "@${room.host.username}",
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF71C5DD),
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      timeago.format(DateTime.parse(room.updatedAt)),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFFb2bdbd),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Text(
                  room.name == " " ? "Untitled Room" : room.name,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.5,
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Divider(
                  color: const Color(0xFFb2bdbd),
                  thickness: 0.5,
                ),
                Chip(
                    elevation: 5,
                    label: Text(
                      room.topic.name == " " ? "No Topic" : room.topic.name,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        letterSpacing: 0.6,
                      ),
                    ),
                    backgroundColor: const Color(0xff51546e)),
              ],
            ),
          )),
    );
  }
}
