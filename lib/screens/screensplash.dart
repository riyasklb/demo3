import 'dart:ffi';
//import 'dart:js';
//import 'dart:js';
import 'package:brototype/screens/screenhome.dart';
import 'package:brototype/screens/screenlogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screenspash extends StatefulWidget {
  const screenspash({super.key});
//  @override
  @override
  State<screenspash> createState() => _screenspashState();
}

class _screenspashState extends State<screenspash> {
  //BuildContext get buildContext => null?;
  final share = 'passwordfile';
  @override
  void initState() {
    goto();
    // TODO: implement inigtState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('splash screen'),
      ),
    );
  }

  Future<void> go() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: ((ctx) => screenlogin())),
    );
  }

  Future<void> goto() async {
    final sharedpreference = await SharedPreferences.getInstance();
    final user = sharedpreference.getBool(share);
    if (user == null || user == false) {
      go();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => screenhome()));
    }
  }

  //void passwordcheck() {}
}
