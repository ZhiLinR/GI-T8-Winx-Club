import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart' as text_themes;
import 'package:winx_app/main_game_page.dart';
import 'package:winx_app/widgets/currency_field.dart';
import 'package:flame/flame.dart';

/// Widget for Top Headers in the Screens
/// Does not apply for the back buttons on the map embeds**
/// Used for Shop, Homepage
/// 1. **required** param[text] - Text to be rendered
class PageTitleHeader extends StatefulWidget {
  const PageTitleHeader({super.key, required this.pageName});
  final String pageName;
  @override
  State<PageTitleHeader> createState() => _PageTitleHeader();
}

class _PageTitleHeader extends State<PageTitleHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text_themes.TextStylingOptions.borderedText(
            widget.pageName, null, null, null, true),
        const CurrencyDisplay()
      ],
    );
  }
}
