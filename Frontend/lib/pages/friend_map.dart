import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart' as text_themes;
import 'package:winx_app/main_game_page.dart';
import 'package:winx_app/mygame.dart';
import 'package:winx_app/widgets/header.dart';
import 'package:winx_app/widgets/friendslist.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:winx_app/pages/shop_page.dart';

import 'package:winx_app/pages/friend_game.dart';

class VisitFriend extends StatefulWidget {
  const VisitFriend({super.key});

  @override
  State<VisitFriend> createState() => _VisitFriend();
}

class _VisitFriend extends State<VisitFriend> {
  //int currentPageIndex = 0;
  final String pageTitle = "Yun's Room";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          const StaticGameMap(),
          Container(
            padding: const EdgeInsets.all(30),
            child: text_themes.TextStylingOptions.borderedText(
                pageTitle, null, null, null, true),
          ),
          const Positioned(right: 30, bottom: 30, child: FriendsList()),
          const Positioned(left: 30, bottom: 30, child: ReturnHome()),
        ],
      ),
    );
  }
}

class StaticGameMap extends StatefulWidget {
  const StaticGameMap({Key? key}) : super(key: key);

  @override
  HomeMap createState() => HomeMap();
}

class HomeMap extends State<StaticGameMap> {
  FriendExtension game = FriendExtension();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [GameWidget(game: game)]);
  }
}
