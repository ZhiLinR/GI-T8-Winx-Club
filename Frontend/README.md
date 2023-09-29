# winx_app

GI-T8-Winx-Club Google Ignite Project

## Documentation of ThemeData
**Widgets with defined styles under ThemeData** 
- NavigationBar -> NavigationBarThemeData 
- Card -> CardTheme 
- Button (specifically **ElevatedButton**) -> ElevatedButtonThemeData
- Checkbox -> checkboxTheme

---

## Documentation for Reusable Classes for Styling
**text_styles.dart** <br>
class TextStylingOptions contains functions to quickly customise text throughout the application, 
if the text styling generated from `ThemeData` clashes with the styling (or can't be seen)
Documentation for the functions has been created within the code

---

### static Function bodyText() 
*Function Call: text_themes.TextStylingOptions.bodyText(Color, boolean, double)*<br>
Styling for text contained within the body.<br>
@return Returns a `Textstyle` object <br>

**Parameters** (? - accepts `null` arguments) <br>
`bodyText(Color? color, bool? strikethrough, double? fontsize)`

1. @param `color` - defines text color; **default value = custom_color.mainTextBrown**; reccomended to use the custom colors in colors.dart
2. @param `strikethrough` - defines if the text needs to have strikethrough decoration; **default = false**
3. @param `fontsize`  - defines fontsize; **default = 20**

---

### static Function borderedText() 
*Function Call: text_themes.TextStylingOptions.borderedText("String", Color, int, double, boolean),*<br>
Styling text for more emphasis with a white border. <br>
@return Returns a `Stack` object which can be inserted directly into child arrays as an element.<br>
Reference method - [Flutter API: Borders and stroke(Foreground)](https://api.flutter.dev/flutter/painting/TextStyle-class.html)

**Parameters** (? - accepts `null` arguments). Default styling is meant for headers. <br>
`(String text, Color? color, double? fontsize,double? strokewidth, bool headerFont)`

1. **required** @param text - Text to be rendered
2. @param `color` - defines text color; **default value = custom_color.headerTextBrown**; reccomended to use the custom colors in colors.dart
3. @param `fontsize`  - defines fontsize; **default = 40**
4. @param `strokewidth` - for smaller font sizes, the stroke width for the border may need to be adjusted; **default = 3**
5. @param `headerFont` - choose font family;  **default = 'Comic Sans Neue ID'**, inputting boolean false will use 'Stanberry' instead