import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'helpers/joypad.dart';
import 'mygame.dart';
import 'helpers/direction.dart';

class MainGamePage extends StatefulWidget {
  const MainGamePage({Key? key}) : super(key: key);

  @override
  MainGameState createState() => MainGameState();
}

class MainGameState extends State<MainGamePage> {
  MyGame game = MyGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            GameWidget(game: game),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child:
                    Joypad(onDirectionChanged: game.onJoypadDirectionChanged),
              ),
            )
          ],
        ));
  }

  void onJoypadDirectionChanged(Direction direction) {
    game.onJoypadDirectionChanged(direction);
  }
}
