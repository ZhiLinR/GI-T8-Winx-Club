import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart' as text_themes;
import 'dart:math';
import 'package:simple_animations/simple_animations.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_gif/flutter_gif.dart';

class MiniGameTurnOffFaucet extends StatefulWidget {
  const MiniGameTurnOffFaucet({super.key});

  @override
  State<MiniGameTurnOffFaucet> createState() => FaucetMiniGame();
}

class FaucetMiniGame extends State<MiniGameTurnOffFaucet> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
      children: <Widget>[
        LoopingBackground(),
        Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Faucet()]),
        )
      ],
    ));
  }
}

class Faucet extends StatefulWidget {
  const Faucet({super.key});

  @override
  State<Faucet> createState() => _Faucet();
}

class _Faucet extends State<Faucet> with TickerProviderStateMixin {
  double maxZRotation = 0.45;
  double originZRotation = 0;

  double currentZRotation = 0.45;

  double startXCoord = 390;
  double endXCoord = 210;

//GIF
  double currentFrame = 0;
  late FlutterGifController controller, controller2;
  @override
  void initState() {
    controller = FlutterGifController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.repeat(
        min: 0,
        max: 2,
        period: const Duration(milliseconds: 200),
      );
    });

    controller2 = FlutterGifController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller2.repeat(
        min: 0,
        max: 2,
        period: const Duration(seconds: 1),
      );
    });
    super.initState();
  }

  String message = "Turn off the tap by dragging to the left!";
  String message2 = "";
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: text_themes.TextStylingOptions.borderedText(
                      message, custom_color.mainTextBrown, 35, null, true)),
              Text(
                message2,
                textAlign: TextAlign.center,
                style: text_themes.TextStylingOptions.bodyText(null, null, 20),
              )
            ],
          )),
      GestureDetector(
          onHorizontalDragStart: (details) {},
          onHorizontalDragUpdate: (details) => {
                //debugPrint(details.delta.toString()),
                setState(() {
                  double currentXCoord = details.globalPosition.dx;
                  if (currentXCoord < endXCoord) {
                    currentZRotation = 0.0;
                  } else {
                    if (currentXCoord < startXCoord) {
                      startXCoord -= 20;
                      currentZRotation -= 0.05;
                      if (currentFrame <= 9) {
                        currentFrame += 2;
                      }
                      controller.animateTo(currentFrame,
                          duration: const Duration(milliseconds: 200));
                    }
                  }
                  //FaucetGIF()
                })
              },
          onHorizontalDragEnd: (details) {
            setState(() {
              if (currentZRotation == 0.0) {
                message = "Good Job!";
                message2 =
                    "Turning off the tap when not in use can save up to 30 litres of water daily (up to 30 waterbottles)!";
                controller.animateTo(18,
                    duration: const Duration(milliseconds: 500));
                controller2.animateTo(8, duration: const Duration(seconds: 5));
                Future.delayed(const Duration(seconds: 6), () {
                  setState(() {
                    Navigator.pop(context);
                  });
                });
              } else {
                controller.repeat(
                    min: currentFrame - 1,
                    max: currentFrame + 1,
                    period: const Duration(milliseconds: 200));
              }
            });
          },
          child: Row(children: [
            Stack(children: <Widget>[
              FaucetHandle(radians: currentZRotation),
              const Image(
                width: 410,
                image: AssetImage("lib/assets/mini_games/faucet.png"),
              ),
              Positioned(
                bottom: 55,
                child: GifImage(
                  controller: controller2,
                  image:
                      const AssetImage("lib/assets/mini_games/water_sink.gif"),
                  width: 410,
                ),
              ),
              Positioned(
                left: 155,
                bottom: 110,
                child: GifImage(
                  controller: controller,
                  image:
                      const AssetImage("lib/assets/mini_games/waterfaucet.gif"),
                  width: 100,
                ),
              ),
            ])
          ]))
    ]);
  }
}

class FaucetHandle extends StatefulWidget {
  const FaucetHandle({super.key, required this.radians});
  final double radians;

  @override
  State<FaucetHandle> createState() => _FaucetHandle();
}

class _FaucetHandle extends State<FaucetHandle> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 118,
      left: 270,
      child: Transform(
        alignment: Alignment.bottomLeft,
        transform: Matrix4.rotationZ(widget.radians),
        child: const Image(
          height: 110,
          image: AssetImage("lib/assets/mini_games/faucet_handle.png"),
        ),
      ),
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
            image: AssetImage("lib/assets/mini_games/background.png"),
            fit: BoxFit.fitWidth,
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
            image: AssetImage('lib/assets/mini_games/background.png'),
            fit: BoxFit.fitWidth,
          ),
        )),
      )
    ]);
  }
}
