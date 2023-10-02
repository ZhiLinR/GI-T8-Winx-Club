import 'package:flutter/material.dart';
import 'package:winx_app/components/navigationBar.dart';
import 'package:winx_app/components/localStorage.dart';
import 'package:winx_app/utility/account_model.dart';
import 'package:winx_app/utility/webHandler.dart';

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
      // Wrap with SingleChildScrollView
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
            children: <Widget>[
              const SizedBox(height: 160),
              const Center(
                child: Text(
                  'App Name',
                  style: TextStyle(
                    fontSize: 65,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String username = usernameController.text;
                  String password = passwordController.text;
                  var acc = getAccount(username, password);
                  if (acc != null) {
                    loggedIn = true;
                    saveStringToLocalStorage('username', username);
                    saveStringToLocalStorage('logged_in', loggedIn.toString());
                  }
                  loggedIn
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavigationExample()),
                        )
                      : const Text('Unable to login');
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
