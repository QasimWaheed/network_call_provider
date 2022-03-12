import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';

class DataProvider extends ChangeNotifier {
  late UserModel userModel;
  List<UserModel> usersList = [];
  postData(context, title, userId) async {
    userModel = await postRequest(context, title, userId);
    notifyListeners();
  }

  fetchData(context) async {
    usersList = await getRequest(context);
    notifyListeners();
  }

  Future<UserModel> postRequest(BuildContext context, String title, String userId) async {
    var dataInput = {'userId' : userId, 'title': title};

    try {
      final response = await http.post(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {'Content-type': 'application/x-www-form-urlencoded'},
        encoding: Encoding.getByName('utf-8'),
        body: dataInput,
      );

      if (response.statusCode == 201) {

        print(response.statusCode);
        print(response.body);
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Something went wrong");
      }
    } on Exception catch (e) {
      print(e);
      return Future.error(e);
    }
  }
  
  Future<List<UserModel>> getRequest(BuildContext context) async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      return ListOfUser.fromJson(response.body).usersList;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
