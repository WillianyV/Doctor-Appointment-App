import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Definindo a constante
const String apiUrl = 'http://127.0.0.1:8000/api';

class DioProvider {
  // get token
  Future<dynamic> getToken(String email, String password) async {
    try {
      var response = await Dio()
          .post('$apiUrl/login', data: {'email': email, 'password': password});
      //retorna o token
      if (response.statusCode == 200 && response.data != '') {
        // compartilha o token no SharedPreferences
        final SharedPreferences preferences =
            await SharedPreferences.getInstance();
        await preferences.setString('token', response.data);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return error;
    }
  }

  //get user Data
  Future<dynamic> getUser(String token) async {
    try {
      var user = await Dio().get('$apiUrl/user',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (user.statusCode == 200 && user.data != '') {
        return json.encode(user.data);
      }
    } catch (error) {
      return error;
    }
  }

  Future<bool> registerUser(String name, String email, String password) async {
    try {
      var user = await Dio().post('$apiUrl/register',
          data: {'name': name, 'email': email, 'password': password});

      print('user: $user');
      if (user.statusCode == 201 && user.data != '') {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print('error: $error');
      // return error;
      return false;
    }
  }
}
