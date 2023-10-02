import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'helpers/joypad.dart';
import 'mygame.dart';
import 'helpers/direction.dart';
import 'package:winx_app/widgets/header.dart';
import 'package:winx_app/pages/mini_games/t_o_faucet.dart';

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
            padding: const EdgeInsets.all(40.0),
            child: Joypad(onDirectionChanged: game.onJoypadDirectionChanged),
          ),
        ),
        Positioned(
          top: 350,
          right: 0,
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MiniGameTurnOffFaucet()));
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.0)),
              )),
        ),
        const Align(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: EdgeInsets.all(30.0), child: GamePageHeader())),
      ],
    ));
  }

  void onJoypadDirectionChanged(Direction direction) {
    game.onJoypadDirectionChanged(direction);
  }
}
