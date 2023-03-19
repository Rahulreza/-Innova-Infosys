
import 'package:flutter/material.dart';
import 'package:flutter_ui_design_task/Pages/login_page.dart';
import 'package:flutter_ui_design_task/conts/color.dart';
import 'package:flutter_ui_design_task/conts/myStyle.dart';
import 'package:flutter_ui_design_task/widgets/cuctom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final usernameController=TextEditingController();
  final passwordController=TextEditingController();


  String?userName;
  String?userPassword;

 Future<void> setUserName (userName)async{
    SharedPreferences setUserName=await SharedPreferences.getInstance();
    setState(() {
      setUserName.setString("sentUserName", userName);
    });
  }

  Future<void> setUserPassword (userPassword)async{
    SharedPreferences setPassword=await SharedPreferences.getInstance();
    setState(() {
      setPassword.setString("sentUserPassword", userPassword);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
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
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon:  Icon( Icons.cancel,color: Colors.green,
                        size: 15,),
                    ),
                    Text(
                      "Sign Up",
                      style: myStyle(16, fontColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("User Name", style: myStyle(16, fontColor)),
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
                    hintText: "Enter your user name",
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
                Text("Password", style: myStyle(16, fontColor)),

                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
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
                    hintText: "Enter your password",
                    prefixIcon: Icon(
                      Icons.key,
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
                    setUserName(usernameController.text);
                    setUserPassword(passwordController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Congratulations! userName & Password set successfully."),
                    ));
                  },
                 isGreen: true,
                  title: "Continue",
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
