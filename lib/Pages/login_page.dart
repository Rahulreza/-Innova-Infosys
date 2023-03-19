import 'package:flutter/material.dart';
import 'package:flutter_ui_design_task/Pages/profile_page.dart';
import 'package:flutter_ui_design_task/Pages/sign_up_page.dart';
import 'package:flutter_ui_design_task/conts/color.dart';
import 'package:flutter_ui_design_task/conts/myStyle.dart';
import 'package:flutter_ui_design_task/widgets/alertDialog.dart';
import 'package:flutter_ui_design_task/widgets/cuctom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String? getUserNameHere;
  String? getUserPasswordHere;

  void getUserName() async {
    SharedPreferences getUserName = await SharedPreferences.getInstance();
    getUserNameHere = getUserName.getString("sentUserName");
    setState(() {});
  }

  void getUserPassword() async {
    SharedPreferences getUserPassword = await SharedPreferences.getInstance();
    getUserPasswordHere = getUserPassword.getString("sentUserPassword");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserName();
    getUserPassword();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.green,
                        size: 15,
                      ),
                    ),
                    Text(
                      "Log In",
                      style: myStyle(16, fontColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Username", style: myStyle(16, fontColor)),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "Enter Username",
                    prefixIcon: Icon(
                      Icons.message,
                      color: boxFontColor,
                    ),
                    hintStyle: TextStyle(
                      color: boxFontColor,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Your Password", style: myStyle(16, fontColor)),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    hintText: "Enter your password",
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: boxFontColor,
                    ),
                    hintStyle: TextStyle(
                      color: boxFontColor,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Custom_Buttom(
                  onTap: () {
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //   content: Text("password is ${getUserPasswordHere}"),
                    // ));
                    usernameController.text.toString() == getUserNameHere &&
                            passwordController.text.toString() ==
                                getUserPasswordHere
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()),
                          )
                        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("userName & Password Wrong"),
                          ));
                  },
                  isGreen: true,
                  title: "Log In",
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Forgot Your Password",
                    style: myStyle(16, fontColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
