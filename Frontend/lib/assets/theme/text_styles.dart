import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;

const defaultStyle =
    TextStyle(fontFamily: 'Comic_Neue_Sans', fontWeight: FontWeight.bold);

final defaultBordered = TextStyle(
    fontSize: 10,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0
      ..color = Colors.blue[700]!);

TextStyle elevatedButtonTextStyle(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.selected,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return defaultStyle;
  }
  return defaultStyle;
}

/// [TextStylingOptions] contains multiple text styling options
class TextStylingOptions {
  /// Styling for text contained within the body. Returns a Textstyle object
  /// 1. param[color] - defines text color; **default value = custom_color.mainTextBrown**; reccomended to use the custom colors in colors.dart
  /// 2. param[strikethrough] - defines if the text needs to have strikethrough decoration; **default = false**
  /// 3. param[fontsize]  - defines fontsize; **default = 20**
  static TextStyle bodyText(
      Color? color, bool? strikethrough, double? fontsize) {
    final TextStyle customStyle;
    strikethrough ??= false;
    color ??= custom_color.mainTextBrown;
    fontsize ??= 20;
    if (strikethrough) {
      customStyle =
          TextStyle(color: color, decoration: TextDecoration.lineThrough);
    } else {
      customStyle = TextStyle(
        color: color,
        fontSize: fontsize,
      );
    }
    return customStyle;
  }

  /// Styling text for more emphasis with a white border.
  /// Returns a Stack object which can be inserted directly into child arrays as an element. Default styling for headers.
  /// Reference method - Borders and stroke (Foreground) https://api.flutter.dev/flutter/painting/TextStyle-class.html
  /// 1. **required** param[text] - Text to be rendered
  /// 2. param[color] - defines text color; **default value = custom_color.headerTextBrown**; reccomended to use the custom colors in colors.dart
  /// 3. param[fontsize]  - defines fontsize; **default = 40**
  /// 4. pararm[strokewidth] - for smaller font sizes, the stroke width for the border may need to be adjusted; **default = 3**
  /// 3. pararm[headerFont] - choose font family;  **default = 'Comic Sans Neue ID'**, inputting boolean false will use 'Stanberry' instead
  static Stack borderedText(String text, Color? color, double? fontsize,
      double? strokewidth, bool headerFont) {
    color ??= custom_color.headerTextBrown;
    fontsize ??= 40;
    strokewidth ??= 3;
    String fontChoice;
    if (headerFont) {
      fontChoice = 'Comic_Neue_Sans';
    } else {
      fontChoice = 'Stanberry';
    }

    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: fontChoice,
            fontSize: fontsize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokewidth
              ..color = const Color.fromARGB(255, 0xFF, 0xFF, 0xFF),
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: fontChoice,
            fontSize: fontsize,
            color: custom_color.headerTextBrown,
          ),
        ),
      ],
    );
  }
}

//Specifically for Headers
