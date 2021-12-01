import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

var linkText = TextStyle(color: Colors.blue);
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gaurav dice app",
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int diceNumber = 1;

  changeDice() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gaurav Rolls Dice"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset(
            "assets/$diceNumber.png",
            height: 250,
            width: 260,
          ),
          MaterialButton(
            color: Colors.red,
            onPressed: changeDice,
            child: Text(
              "Roll me",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 280,
          ),
          Text(
            "Luck is beleiving you are lucky ; )",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: linkText,
                  text: "For more information - www.gauravrizal.com.np",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      var url = "https://gauravrizal.com.np/";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw "cannot load Url";
                      }
                    })
            ])),
          ),
        ],
      ),
    );
  }
}
