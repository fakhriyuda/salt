import 'package:dio/dio.dart';
import 'package:salt_test/features/home/data/model/user.dart';

class HomeRepository {
  static Future<Users> getHome() async {
    final dio = Dio();
    var response = await dio.get("https://reqres.in/api/users?page=2");
    // print(response.data);
    // var test = usersFromJson(response.data);
    // print(test);
    return Users.fromJson(response.data);
  }
}
