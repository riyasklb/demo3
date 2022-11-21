//import 'dart:js';

import 'package:brototype/main.dart';
import 'package:brototype/screens/screenhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screenlogin extends StatefulWidget {
  @override
  State<screenlogin> createState() => _screenloginState();
}

class _screenloginState extends State<screenlogin> {
  //screenlogin({super.key});
  final email = TextEditingController();

  final password = TextEditingController();

  bool datamach = true;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formkey,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'EMAIL'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'value is emptty';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'PASSWORD'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is epty';
                    } else {
                      return null;
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Visibility(
                      visible: !datamach,
                      child: Text(
                        'invalid password',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            passwordcheck(context);
                          } else {
                            print('data epmty');
                          }

                          // passwordcheck(context);
                        },
                        icon: Icon(Icons.check),
                        label: Text('login')),
                  ],
                ),
              ]),
            )
            //],
            ),
      ),
    );
  }

  void passwordcheck(ctx) async {
    final a = email.text;
    final b = password.text;
    if (a == b) {
      print('user name passxord has mach');
      final SharedPreference = await SharedPreferences.getInstance();
      SharedPreference.setBool(savekey, true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => screenhome()));
    } else {
      print('user name password does not mach');
      // showDialog(
      //     context: ctx,
      //     builder: (context) {
      //       return AlertDialog(
      //         title: Text('error'),
      //         content: Text('invalid'),
      //         actions: [
      //           TextButton(
      //               onPressed: () {
      //                 Navigator.of(ctx).pop();
      //               },
      //               child: Text('close'))
      //         ],
      //       );
      //     });
      // ScaffoldMessenger.of(ctx).showSnackBar((SnackBar(
      //   behavior: SnackBarBehavior.floating,
      //   content: Text('in valid pasword'),
      //   margin: EdgeInsets.all(10),
      //   //duration: Duration(seconds: 5),
      //   backgroundColor: Colors.amber,
      // )));
      setState(() {
        datamach = false;
      });
    }
  }
}
