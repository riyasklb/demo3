//import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// class blah extends StatelessWidget {
//   get RRGGBB => null;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('example 02'),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(4),
//           child: StaggeredGrid.count(
//             crossAxisCount: 2,
//             children: [
//               Text('blah'),
//               Text('blah'),
//               Text('blah'),
//               Text('blah'),
//               Text('blah'),
//               Text('blah'),
//               Text('blah'),
//             ],
//           )),
//     );
//   }
// }

// void main(List<String> args) {
//   runApp(app());
// }

// class app extends StatelessWidget {
//   const app({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(),
//       home: blah(),
//     );
//   }
// }
import 'package:brototype/screens/screenlogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screenhome extends StatelessWidget {
  const screenhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text('home screen'))),
      appBar: AppBar(
        title: Text('home'),
        actions: [
          IconButton(
              onPressed: () {
                out(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
    );
  }

  out(BuildContext ctx) async {
    final SharedPreference = await SharedPreferences.getInstance();
    await SharedPreference.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => screenlogin()), (route) => false);
  }
}
