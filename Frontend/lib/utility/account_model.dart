import 'dart:convert';

List<Account> accountsFromJson(String str) =>
    List<Account>.from(json.decode(str).map((x) => Account.fromJson(x)));

String accountsToJson(List<Account> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

class Account {
  String username;
  String password;
  String nickname;
  int balance;
  int taskCount;
  List<UserItem> items;

  Account({
    required this.username,
    required this.password,
    required this.nickname,
    required this.balance,
    required this.taskCount,
    required this.items,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        username: json["username"],
        password: json["password"],
        nickname: json["nickname"],
        balance: json["balance"],
        taskCount: json["task_count"],
        items:
            List<UserItem>.from(json["items"].map((x) => UserItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "nickname": nickname,
        "balance": balance,
        "task_count": taskCount,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class UserItem {
  String itemName;
  int itemCount;

  UserItem({
    required this.itemName,
    required this.itemCount,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
        itemName: json["item_name"],
        itemCount: json["item_count"],
      );

  Map<String, dynamic> toJson() => {
        "item_name": itemName,
        "item_count": itemCount,
      };
}
