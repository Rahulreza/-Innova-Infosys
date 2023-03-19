

import 'package:flutter/material.dart';
import 'package:flutter_ui_design_task/conts/myStyle.dart';
import 'package:flutter_ui_design_task/model/callMethod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Method method = Method();


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                backgroundImage: AssetImage("images/rahul.png"),
                //radius: 100,
                maxRadius: 100,
              ),
              Text(
                "Md.Rahul Reza",
                style: myStyle(18, Color(0xff32B768), FontWeight.bold),
              ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: FaIcon(FontAwesomeIcons.github),
              color: Color(0xffffA8B2D1),
              iconSize: 24.0,
              onPressed: () {
                method.launchURL(
                    "https://github.com/Rahulreza");
              }),
          IconButton(
              icon: FaIcon(FontAwesomeIcons.linkedin),
              color: Color(0xffffA8B2D1),
              iconSize: 24.0,
              onPressed: () {
                method.launchURL(
                    "http://www.linkedin.com/in/rahul-reza");
              }),

          IconButton(
            icon: FaIcon(FontAwesomeIcons.facebook),
            color: Color(0xffffA8B2D1),
            onPressed: () {
              method.launchURL(
                  "https://www.facebook.com/rahulrezaraz");
            },
            iconSize: 24.0,
          ),
          IconButton(
              icon: Icon(Icons.call),
              color: Color(0xffffA8B2D1),
              iconSize: 24.0,
              onPressed: () {
                method.launchCaller();
              }),
          IconButton(
              icon: Icon(Icons.mail),
              color: Color(0xffffA8B2D1),
              iconSize: 24.0,
              onPressed: () {
                method.launchEmail();
              })
        ],
      )
            ],
          ),
        ),
      ),
    );
  }
}
