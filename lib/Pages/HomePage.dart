import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_design_task/Pages/login_page.dart';
import 'package:flutter_ui_design_task/Pages/sign_up_page.dart';
import 'package:flutter_ui_design_task/conts/myStyle.dart';
import 'package:flutter_ui_design_task/widgets/cuctom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Center(

          child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset("images/ordersuccess.svg"),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome",
                style: myStyle(
                  24,
                  Color(0xff1F2937),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Before enjoying Foodmedia services Please register first",
                style: myStyle(
                  14,
                  Color(0xff4B5563),
                ),
              ),
              Custom_Buttom(
                title: "Create Account",
                isGreen: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Custom_Buttom(
                title: "Login",
                isGreen: false,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
              // SizedBox(
              //   height: 10,
              // ),
              RichText(
                text: TextSpan(
                  text: 'By Logging In Or Registering, You Have Agreed To ',
                  style: myStyle(10, Color(0xff242323),),
                  children: const <TextSpan>[
                    TextSpan(text: 'the Terms and Conditions', style: TextStyle(color: Color(0xff32B768),fontSize: 10),),
                    TextSpan(text: ' And',style: TextStyle(fontSize: 10,color: Color(0xff242323)),),
                    TextSpan(text: ' Privacy Policy.', style: TextStyle(color: Color(0xff32B768),fontSize: 10),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
