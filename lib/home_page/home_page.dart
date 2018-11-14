import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'home_content.dart';

// import 'package:barcode_scan/barcode_scan.dart';
// import 'dart:async';
// import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Default placeholder text
  String textToShow = "I Like Flutter ccc";
  void _updateText() {
    setState(() {
      // update the text
      textToShow = "Flutter is Awesome!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Sample App"),
      ),
      body: new HomeContent(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   HomePage({Key key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // Default placeholder text
//   String textToShow = "A";
//   void _updateText() {
//     setState(() {
//       // update the text
//       textToShow = "Flutter is Awesome!";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: new CupertinoNavigationBar(
//         backgroundColor: const Color(0xFFFF0066),
//         leading: new Container(
//           padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//           child: new Image.asset('images/logo@2x.png'),
//         ),
//         middle: new Text("Title"),
//         trailing: Container(
//           width: 22.0,
//           height: 30.0,
//           child: CupertinoButton(
//             padding: const EdgeInsets.all(0.0),
//             child: Image.asset(
//               "images/icon_二维码@2x.png",
//               width: 22.0,
//               height: 22.0,
//             ),
//             onPressed: () {
//               scan();
//               // Navigator.of(context).push(new MaterialPageRoute<Null>(
//               //   builder: (BuildContext context) {
//               //     return new ScanerPage();
//               //   },
//               // ));

//               // Navigator.of(context).push(route)
//             },
//           ),
//         ),
//       ),
//       child: Center(child: Text(textToShow)),
//     );
//   }

//   Future scan() async {
//     try {
//       String barcode = await BarcodeScanner.scan();
//       // setState(() {
//       //   return this.barcode = barcode;
//       // });
//     } on PlatformException catch (e) {
//       if (e.code == BarcodeScanner.CameraAccessDenied) {
//         // setState(() {
//         //   return this.barcode = 'The user did not grant the camera permission!';
//         // });
//       } else {
//         // setState(() {
//         //   return this.barcode = 'Unknown error: $e';
//         // });
//       }
//     } on FormatException{
//       // setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
//     } catch (e) {
//       // setState(() => this.barcode = 'Unknown error: $e');
//     }
//   }

// }
