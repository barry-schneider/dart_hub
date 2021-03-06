import 'dart:async';
import 'package:dart_hub/interactor/manager/auth_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  final AuthManager _authManager;

  SplashScreen(this._authManager);

  @override
  State<StatefulWidget> createState() => new _SplashState(_authManager);
}

class _SplashState extends State<SplashScreen> {

  final AuthManager _authManager;

  _SplashState(this._authManager);

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future _init() async {
    await _authManager.init();

    String route;
    if (_authManager.loggedIn) {
      route = '/home';
    } else {
      route = '/login';
    }

    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
            child: new CircularProgressIndicator()
        )
    );
  }
}
