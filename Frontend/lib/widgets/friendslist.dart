import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart' as text_themes;
import 'package:winx_app/main_game_page.dart';
import 'package:winx_app/mygame.dart';
import 'package:winx_app/pages/home_page.dart';
import 'package:winx_app/widgets/header.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:winx_app/pages/shop_page.dart';

import 'package:winx_app/pages/friend_game.dart';
import 'package:winx_app/pages/friend_map.dart';

class FriendsList extends StatefulWidget {
  const FriendsList({super.key});

  @override
  State<FriendsList> createState() => _FriendsList();
}

class _FriendsList extends State<FriendsList> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {});
          showBottomSheet<void>(
              enableDrag: true,
              transitionAnimationController: AnimationController(
                vsync: this,
                duration: const Duration(seconds: 1),
                reverseDuration: const Duration(milliseconds: 500),
              ),
              context: context,
              builder: (BuildContext context) {
                return AnimatedContainer(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceIn,
                    child: ListView(children: [
                      Container(
                          alignment: Alignment.center,
                          child: text_themes.TextStylingOptions.borderedText(
                              "Friends List", null, 30, 1.5, true)),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text("Yun"),
                          trailing: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VisitFriend()));
                              },
                              child: Text("Visit Friend")),
                        ),
                      )
                    ]));
              });
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.fromLTRB(0, 10, 0, 10)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ))),
        child:
            const Column(children: [Icon(Icons.diversity_1), Text("Friends")]));
  }
}

class ReturnHome extends StatefulWidget {
  const ReturnHome({super.key});

  @override
  State<ReturnHome> createState() => _ReturnHome();
}

class _ReturnHome extends State<ReturnHome> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          /*      Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage())); */
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.fromLTRB(0, 10, 0, 10)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ))),
        child: const Column(children: [Icon(Icons.home), Text("Home")]));
  }
}
