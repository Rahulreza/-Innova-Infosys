import 'package:flutter/material.dart';
import 'package:flutter_ui_design_task/conts/myStyle.dart';

class Custom_Buttom extends StatelessWidget {
  Custom_Buttom({
    super.key,this.title,this.onTap,  this.isGreen
  }) ;


  String ?title;
  VoidCallback ?onTap;
  bool? isGreen;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onTap,
      minWidth: double.infinity,
      padding: EdgeInsets.only(
          top: 17,
          right: 128,
          left: 128,
          bottom: 17
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: isGreen==true?Colors.transparent:Color(0xffd1fae5)),
        borderRadius: BorderRadius.circular(28),
      ),
      color: isGreen==true?Color(0xff32b768):Color(0xffd1fae5),
      child: Text("$title",style: myStyle(14,isGreen==true?Color(0xffd1fae5):Color( 0xff32b768) ),),
    );
  }
}