import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy/models/all_models.dart';
import 'package:studybuddy/utils/network_util.dart';

class DataProvider extends ChangeNotifier {
  User? currentUser;
  List<Room> rooms;
  bool isLoading;

  DataProvider({this.currentUser, this.rooms = const [], this.isLoading = true});

  void getRooms() async {
    isLoading = true;
    notifyListeners();
    try {
      Response response = await NetworkUtil.instance.get('rooms/');
      List<dynamic> roomsMap = response.data as List<dynamic>;
      rooms = [];
      for (var roomMap in roomsMap) {
        rooms.add(Room.fromMap(roomMap as Map<String, dynamic>));
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    isLoading = false;
    notifyListeners();
  }
}
