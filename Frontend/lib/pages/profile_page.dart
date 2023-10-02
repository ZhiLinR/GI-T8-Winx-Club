import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/text_styles.dart';
//import 'package:flutter/widgets.dart';
import 'package:winx_app/components/localStorage.dart';
import 'package:winx_app/utility/account_model.dart';
import 'package:winx_app/utility/webHandler.dart';
import 'package:simple_animations/simple_animations.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: const DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('lib/assets/theme/profile_pic.jpg'))),
              child: const Image(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("lib/assets/theme/background_house.png"))),
          TextStylingOptions.borderedText(
              'Name: $nickname', null, 30, null, false),
          TextStylingOptions.borderedText(
              'Currency: $currency', null, 30, null, false),
          TextStylingOptions.borderedText(
              'Tasks completed: $tasksCompleted', null, 30, null, false),
        ],
      )),
    );
  }
}

class LoopingBackground extends StatelessWidget {
  const LoopingBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      LoopAnimationBuilder<double>(
        tween: Tween(
            begin: -MediaQuery.of(context).size.width,
            end: 0), // value for offset x-coordinate
        duration: const Duration(seconds: 10),
        curve: Curves.linear,
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(value, 0), // use animated value for x-coordinate
            child: child,
          );
        },
        child: Container(
            decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/theme/background_sky.png"),
            fit: BoxFit.cover,
          ),
        )),
      ),
      LoopAnimationBuilder<double>(
        tween: Tween(
            begin: 0,
            end: MediaQuery.of(context)
                .size
                .width), // value for offset x-coordinate
        duration: const Duration(seconds: 10),
        curve: Curves.linear,
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(value, 0), // use animated value for x-coordinate
            child: child,
          );
        },
        child: Container(
            decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/theme/background_sky.png'),
            fit: BoxFit.cover,
          ),
        )),
      )
    ]);
  }
}
