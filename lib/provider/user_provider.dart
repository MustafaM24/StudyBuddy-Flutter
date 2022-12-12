import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studybuddy/auth/login.dart';
import 'package:studybuddy/models/all_models.dart';
import 'package:studybuddy/utils/navigation_service.dart';
import 'package:studybuddy/utils/network_util.dart';

class UserProvider extends ChangeNotifier {
  User? currentUser;
  bool isLoading;

  UserProvider({this.isLoading = true});

  void enableLoading() {
    isLoading = true;
    notifyListeners();
  }

  void disableLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> checkAlreadyLoggedIn() async {
    enableLoading();
    try {
      String? accessToken = await _getAccessTokenFromLocal();
      if (accessToken == null) {
        disableLoading();
      } else {
        // get user details from server
        await _getUser(accessToken);
        // set current user
        disableLoading();
      }
    } catch (e) {
      disableLoading();
      print(e);
    }
  }

  Future<void> login(String username, String password) async {
    enableLoading();
    try {
      // make a post request to login
      Response response = await NetworkUtil.instance.post('token/', data: {
        'username': username,
        'password': password,
      });
      // get access token
      String token = response.data['token'] as String;
      // save access token to local
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      // get user details from server
      await _getUser(token);
    } catch (e) {
      print(e);
      disableLoading();
    }
    // set current user
    disableLoading();
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    currentUser = null;
    notifyListeners();
    Navigator.pushAndRemoveUntil(NavigationService.navigatorKey.currentContext!, MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }

  Future<void> _getUser(String accessToken) async {
    Response response = await NetworkUtil.instance.get('user', accessToken: accessToken);
    currentUser = User.fromMap(response.data as Map<String, dynamic>);
  }

  Future<String?> _getAccessTokenFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }
}
