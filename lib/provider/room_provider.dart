import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy/models/all_models.dart';
import 'package:studybuddy/utils/network_util.dart';

class RoomProvider extends ChangeNotifier {
  List<Room> _rooms = [];
  bool isLoading;
  String filter = "";

  List<Room> get rooms => filter == ""
      ? _rooms
      : _rooms
          .where((Room room) =>
              room.name.toLowerCase().contains(filter.toLowerCase()) ||
              room.host.username.toLowerCase().contains(filter.toLowerCase()) ||
              room.topic.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();

  RoomProvider({this.isLoading = true});

  void setFilter(String filter) {
    this.filter = filter;
    notifyListeners();
  }

  void getRooms() async {
    isLoading = true;
    notifyListeners();
    try {
      Response response = await NetworkUtil.instance.get('rooms/');
      List<dynamic> roomsMap = response.data as List<dynamic>;
      _rooms = [];
      for (var roomMap in roomsMap) {
        _rooms.add(Room.fromMap(roomMap as Map<String, dynamic>));
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
