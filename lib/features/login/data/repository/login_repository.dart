import 'package:dio/dio.dart';

class LoginRepository {
  final dio = Dio();

  Future login(String email, String password) async {
    var response = await dio.post("https://reqres.in/api/login",data: {'email': email, 'password': password});
    print(response);
    return response.data;
  }
}
