import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_bloc/bloc_pattern/models/user_model.dart';


class ApiService{
  Future<List<UserModel>> getData() async {
    List<UserModel> userDataList = [];
    final Dio _dio = Dio();

    try {
      Response response = await _dio.get('https://jsonplaceholder.typicode.com/users');

      if (response.statusCode == 200) {
        List<dynamic>data = response.data;
        for (var element in data) {
          UserModel userModel = UserModel.fromJson(element);
          userDataList.add(userModel);
        }
        return userDataList;
      } else {
        return [];
      }
    } catch(e){
      debugPrint('Catch Error:$e');
      rethrow;
    
    }
  }
}