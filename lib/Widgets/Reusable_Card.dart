import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
 Color? color ;
 Widget? widget ;
 ReusableCard ({@required this.widget ,@required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
    borderRadius: BorderRadiusDirectional.circular(15),
    color: this.color,
    ),
      child: this.widget,
    );
  }
}
