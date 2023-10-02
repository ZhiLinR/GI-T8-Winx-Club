import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart';
import 'package:winx_app/utility/webHandler.dart';
import 'package:winx_app/main_game_page.dart';
import 'package:flame/flame.dart';

class CurrencyDisplay extends StatefulWidget {
  const CurrencyDisplay({super.key});

  @override
  State<CurrencyDisplay> createState() => _CurrencyDisplay();
}

class _CurrencyDisplay extends State<CurrencyDisplay> {
  dynamic accountBalance;
  @override
  void initState() {
    late final Future itemList =
        Future.value(ApiService().getAccountByUsername("yun"));
    dynamic catalogue;
    Future.value(itemList).then((value) {
      debugPrint(value.runtimeType.toString());
      accountBalance = value.balance;
    });
    debugPrint(catalogue.runtimeType.toString());
    super.initState();
  }

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
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 3, 0, 5),
                    child: TextStylingOptions.borderedText(
                        accountBalance.toString(), null, 20, null, true),
                  ),
                  CustomIcons.currencyIcon(20)
                ]))
      ],
    );
  }
}

/* class AnimatedCoinBank extends StatefulWidget {
  const AnimatedCoinBank({super.key});

  @override
  State<AnimatedCoinBank> createState() => _AnimatedCoinBank();
}

class _AnimatedCoinBank extends State<AnimatedCoinBank> {
  @override
  Widget build(BuildContext context) {
    return CustomIcons.currencyIcon(20);
  }
} */
