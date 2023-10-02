import 'package:flutter/material.dart';
import 'package:winx_app/components/navigationBar.dart';
import 'package:winx_app/components/localStorage.dart';
import 'package:winx_app/utility/account_model.dart';
import 'package:winx_app/utility/webHandler.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:winx_app/assets/theme/colors.dart' as custom_color;
import 'package:winx_app/assets/theme/text_styles.dart' as text_themes;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late final Future account;
  var loggedIn = false;

  Future getAccount(String username, String password) async {
    try {
      account = Future.value(
          ApiService().getAccountByUsernameAndPassword(username, password));
      return account;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const LoopingBackground(),
        Positioned(
            child: Container(
                height: MediaQuery.sizeOf(context).height,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/theme/background_house.png"),
                    fit: BoxFit.cover,
                  ),
                ))),
        // Wrap with SingleChildScrollView
        Container(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // Set mainAxisSize to min
            children: <Widget>[
              const Image(
                  alignment: Alignment.topCenter,
                  width: 250,
                  height: 150,
                  image: AssetImage("lib/assets/theme/logo.png")),
              Container(
                alignment: Alignment.topCenter,
                //margin: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(35.0)),
                                borderSide: BorderSide(
                                    color: custom_color.outlineBrown,
                                    width: 3.0)),
                            labelText: 'Username'),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white54,
                          border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(35.0)),
                              borderSide: BorderSide(
                                  color: custom_color.outlineBrown,
                                  width: 3.0)),
                          labelText: 'Password'),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    String username = usernameController.text;
                    String password = passwordController.text;
                    var acc = getAccount(username, password);
                    if (acc != null) {
                      loggedIn = true;
                      saveStringToLocalStorage('username', username);
                      saveStringToLocalStorage(
                          'logged_in', loggedIn.toString());
                    }
                    loggedIn
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NavigationExample()),
                          )
                        : const Text('Unable to login');
                  },
                  child: const Text('Login'),
                ),
              )
            ],
          ),
        ),
      ],
    ));
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
            image: AssetImage("lib/assets/theme/background_sky.png"),
            fit: BoxFit.cover,
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
            image: AssetImage('lib/assets/theme/background_sky.png'),
            fit: BoxFit.cover,
          ),
        )),
      )
    ]);
  }
}
