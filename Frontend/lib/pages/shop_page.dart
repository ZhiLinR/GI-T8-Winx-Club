import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart' as text_themes;
import 'package:winx_app/mygame.dart';
import 'package:winx_app/widgets/header.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

class ShopCatalogue extends StatefulWidget {
  const ShopCatalogue({super.key});

  @override
  State<ShopCatalogue> createState() => _ShopCatalogue();
}

class _ShopCatalogue extends State<ShopCatalogue>
    with TickerProviderStateMixin {
  int currentPageIndex = 0;

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
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceIn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              });
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.fromLTRB(0, 10, 0, 10)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ))),
        child: const Column(children: [Icon(Icons.storefront), Text("Shop")]));
  }
}
