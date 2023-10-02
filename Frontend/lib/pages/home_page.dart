import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart' as text_themes;
import 'package:winx_app/main_game_page.dart';
import 'package:winx_app/mygame.dart';
import 'package:winx_app/widgets/header.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:winx_app/pages/shop_page.dart';
import 'package:winx_app/pages/friend_map.dart';
import 'package:winx_app/widgets/friendslist.dart';
import 'package:winx_app/components/localStorage.dart';
import 'package:winx_app/utility/webHandler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  dynamic accountBalance;
  String username = getStringFromLocalStorage('username').toString();
  @override
  void initState() {
    final Future itemList =
        Future.value(ApiService().getAccountByUsername(username));
    Future.value(itemList).then((value) {
      debugPrint(value.runtimeType.toString());
      accountBalance = value.balance;
      setState(() {});
    });
    super.initState();
  }

  //int currentPageIndex = 0;
  final String pageTitle = "My Room";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.topRight, children: [
      const StaticGameMap(),
      Container(
          padding: const EdgeInsets.all(30),
          child: PageTitleHeader(pageName: pageTitle)),
      Center(
          heightFactor: MediaQuery.sizeOf(context).height,
          widthFactor: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainGamePage()));
                  },
                  child: const Text("Start Daily Tasks"))
            ],
          )),
      const Positioned(left: 30, bottom: 30, child: ShopCatalogue()),
      const Positioned(left: 30, bottom: 110, child: FriendsList()),
    ]));
  }
}

class StaticGameMap extends StatefulWidget {
  const StaticGameMap({Key? key}) : super(key: key);

  @override
  HomeMap createState() => HomeMap();
}

class HomeMap extends State<StaticGameMap> {
  MyGame game = MyGame();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [GameWidget(game: game)]);
  }
}
