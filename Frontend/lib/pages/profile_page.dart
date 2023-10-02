import 'package:flame/components.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:winx_app/components/localStorage.dart';
import 'package:winx_app/utility/account_model.dart';
import 'package:winx_app/utility/webHandler.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  //late Future futureAccount;
  String username = getStringFromLocalStorage('username').toString();

  var nickname = "";
  var currency = 0;
  var tasksCompleted = 0;

  bool isLoading = true;

  @override
  void initState() {
    late final Future<Account?> account =
        Future.value(ApiService().getAccountByUsername(username));
    Future.value(account).then((value) {
      nickname = value!.nickname;
      currency = value.balance;
      tasksCompleted = value.taskCount;
      isLoading = false;
      debugPrint(nickname);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text('Name: $nickname'),
          Text('Currency: $currency'),
          Text('Tasks completed: $tasksCompleted'),
        ],
      )),
    );
  }
}
