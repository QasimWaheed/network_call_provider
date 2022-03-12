import 'dart:convert';

class UserModel {
  UserModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  String userId;
  int id;
  String title;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"].toString(),
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}

class ListOfUser {
  final List<UserModel> usersList;

  ListOfUser({
    required this.usersList,
  });

  factory ListOfUser.fromJson(String json) => ListOfUser(
        usersList: List<UserModel>.from(
          jsonDecode(json).map(
            (x) => UserModel.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "Response": List<dynamic>.from(usersList.map((x) => x.toJson())),
      };
}
