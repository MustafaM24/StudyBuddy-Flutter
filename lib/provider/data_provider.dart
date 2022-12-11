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
      List<Map<String,dynamic>> data = response.data;
      rooms = response.data.map((e) => Room.fromMap(e)).toList();
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
