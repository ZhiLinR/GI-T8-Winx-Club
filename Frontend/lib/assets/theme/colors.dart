import 'package:flutter/material.dart';

//this uses hex in the format of #42A5F5 described as (0xFF, 0x42, 0xA5, 0xF5), first parameter being transparency

//Text Theme colors
//Main text brown Colour: #835D43
Color mainTextBrown = const Color.fromARGB(0xFF, 0x83, 0x5D, 0x43);
//Main text black Colour: #545454
Color primaryTextBlack = const Color.fromARGB(0xFF, 0x54, 0x54, 0x54);

//Colour for Page headers #643F26
Color headerTextBrown = const Color.fromARGB(0xFF, 0x64, 0x3F, 0x26);
//Outline
Color outlineBrown = const Color.fromARGB(0xFF, 0x83, 0x5D, 0x43);

//Background Colours
Color primaryBGBrown = const Color.fromARGB(0xFF, 0xE2, 0xAB, 0x86);
//#F1D5C1
Color secondaryBGBrown = const Color.fromARGB(0xFF, 0xF1, 0xD5, 0xC1);

//Icon Colours
//#545454
Color activeIcon = const Color.fromARGB(0xFF, 0x54, 0x54, 0x54);
//#835D43
Color inactiveIcon = const Color.fromARGB(0xFF, 0x83, 0x5D, 0x43);
//#C58A62
Color activeIconBG = const Color.fromARGB(0xFF, 0xC5, 0x8A, 0x62);
/* IconThemeData iconColorChange(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.selected,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return IconThemeData(color: activeIcon);
  }
  return IconThemeData(color: inactiveIcon);
} */

//Checkbox Colours
//#835D43
Color checkBox = const Color.fromARGB(0xFF, 0x83, 0x5D, 0x43);
Color checkBoxFill(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.selected,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return checkBox;
  }
  return const Color(0x00FFFFFF);
}

//Text Button Data
Color elevatedButtonState(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.selected,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return primaryBGBrown;
  }
  return secondaryBGBrown;
}
