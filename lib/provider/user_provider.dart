
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:appdev_2/repo/network.dart';

part 'user_provider.g.dart';

final dio = Dio();

@riverpod
Future<List<User>> user(UserRef ref) async {
  // final response = await dio.get('https://jsonplaceholder.typicode.com/users');
  // List<dynamic> jsonList = response.data;
  // List<User> userList = jsonList.map((userJson) => User.fromJson(userJson)).toList();
  // return userList;

  ApiClient client = ApiClient();
  return client.getUser();

}