import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart' as text_themes;
import 'package:winx_app/mygame.dart';
import 'package:winx_app/widgets/header.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:winx_app/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int currentPageIndex = 0;
  final String pageTitle = "My Room";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.assignment),
            icon: Icon(Icons.assignment_outlined),
            label: 'Daily Tasks',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.account_box),
            icon: Icon(Icons.account_box_outlined),
            label: 'Profile',
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          const StaticGameMap(),
          Container(
              padding: const EdgeInsets.all(30),
              child: PageTitleHeader(pageName: pageTitle)),
          const Positioned(left: 30, bottom: 30, child: ShopCatalogue())
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
  MyGame game = MyGame();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [GameWidget(game: game)]);
  }
}
