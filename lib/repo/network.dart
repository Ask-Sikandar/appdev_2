import 'dart:core';

import 'package:dio/dio.dart';
import 'package:appdev_2/model/user_model.dart';
import 'dart:convert';

final dio = Dio();

class ApiClient {
  ApiClient();

  Future<List<User>> getUser() async {
    // final response = await dio.get('https://jsonplaceholder.typicode.com/users');
    // final parsed = response.data[0];
    // final user = User.fromJson(parsed);
    // return user;

    final response = await dio.get('https://jsonplaceholder.typicode.com/users');
    List<dynamic> jsonList = response.data;
    List<User> userList = jsonList.map((userJson) => User.fromJson(userJson)).toList();
    return userList;
  }
}
// Future<void> main() async {
//   ApiClient myclient = ApiClient();
//   User myuser = await myclient.getUser();
// }

