import 'package:flutter/material.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart' as text_themes;
import 'package:winx_app/pages/login_page.dart';
import 'main_game_page.dart';
import 'package:flame/flame.dart';
import 'package:winx_app/pages/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
//import 'package:winx_app/utility/widget_testing.dart';

/* void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  runApp(const MyApp());
} */

Future main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static int accountBalance = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          //todo: input decoration/button
          fontFamily: 'Stanberry',
          colorScheme: ColorScheme.fromSeed(
              seedColor: custom_color.primaryBGBrown,
              background: custom_color.secondaryBGBrown),
          useMaterial3: true,
          iconTheme: IconThemeData(color: custom_color.inactiveIcon),
          navigationBarTheme: NavigationBarThemeData(
            elevation: 10,
            backgroundColor: custom_color.primaryBGBrown,
            indicatorColor: custom_color.activeIconBG,
            iconTheme: MaterialStateProperty.resolveWith(
                (states) => IconThemeData(color: custom_color.inactiveIcon)),
          ),
          checkboxTheme: CheckboxThemeData(
              checkColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white),
              fillColor:
                  MaterialStateProperty.resolveWith(custom_color.checkBoxFill),
              side: BorderSide(color: custom_color.checkBox, width: 16.0)),
          cardTheme: CardTheme(
              color: custom_color.primaryBGBrown,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                      color: custom_color.outlineBrown, width: 3.0))),
          highlightColor: Colors.white,
          bottomSheetTheme: BottomSheetThemeData(
              //modalBarrierColor: custom_color.outlineBrown,
              modalBackgroundColor: custom_color.secondaryBGBrown,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                top: Radius.circular(35.0),
              )),
              backgroundColor: custom_color.secondaryBGBrown,
              showDragHandle: true,
              dragHandleColor: custom_color.outlineBrown),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => custom_color.mainTextBrown),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      custom_color.elevatedButtonState),
                  elevation: MaterialStateProperty.resolveWith((states) => 3),
                  side: MaterialStateProperty.resolveWith((states) =>
                      BorderSide(color: custom_color.outlineBrown, width: 2.0)),
                  textStyle: MaterialStateProperty.resolveWith(
                      text_themes.elevatedButtonTextStyle)))),

      // remove default debug banner
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

// *** Original Demo Homepage ***
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text('$_counter',
//                 style: TextStyle(color: custom_color.mainTextBrown)),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
