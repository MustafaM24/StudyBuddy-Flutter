import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    Key? key,
    required this.avatarUrl,
    required this.size,
  }) : super(key: key);

  final String avatarUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (avatarUrl == "https://res.cloudinary.com/dhczblu2g/image/upload/v1/images/avatar.svg") {
      return CircleAvatar(
        backgroundColor: const Color(0xFF2D2D39),
        radius: size / 2,
        child: Icon(
          Icons.person_rounded,
          color: const Color(0xFF71C5DD),
          size: size / 2,
        ),
      );
    }
    return CircleAvatar(
      backgroundColor: const Color(0xFF2D2D39),
      radius: size / 2,
      onBackgroundImageError: (exception, stackTrace) => Icon(
        Icons.person_rounded,
        color: Color(0xFF71C5DD),
        size: size,
      ),
      backgroundImage: CachedNetworkImageProvider(avatarUrl, maxHeight: size.toInt(), maxWidth: size.toInt()),
    );
  }
}
