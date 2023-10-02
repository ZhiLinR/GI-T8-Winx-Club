import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart' as text_themes;
import 'package:winx_app/main_game_page.dart';
import 'package:flame/flame.dart';

class CurrencyDisplay extends StatefulWidget {
  const CurrencyDisplay({super.key});

  @override
  State<CurrencyDisplay> createState() => _CurrencyDisplay();
}

class _CurrencyDisplay extends State<CurrencyDisplay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            height: 50,
            width: 100,
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
              color: custom_color.secondaryBGBrown,
              border: Border.all(color: custom_color.outlineBrown, width: 3.0),
              borderRadius: BorderRadius.circular(100),
            ),
            child: text_themes.TextStylingOptions.borderedText(
                "100", null, 20, 1.0, false)),
        const Positioned(right: 20, top: 10, child: AnimatedCoinBank())
      ],
    );
  }
}

class AnimatedCoinBank extends StatefulWidget {
  const AnimatedCoinBank({super.key});

  @override
  State<AnimatedCoinBank> createState() => _AnimatedCoinBank();
}

class _AnimatedCoinBank extends State<AnimatedCoinBank> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Icon(
          Icons.monetization_on_rounded,
          fill: 1.0,
          color: Color.fromARGB(0xFF, 0xFF, 0xDF, 0x36),
        ),
        Icon(
          Icons.savings_rounded,
          fill: 1.0,
          color: Color.fromARGB(0xD8, 0xFF, 0x9A, 0x6F),
        ),
      ],
    );
  }
}
