import 'package:dibloma_6_bmi/Model/Constant.dart';
import 'package:flutter/material.dart';
class IconType extends StatefulWidget {
  IconData? icon ;
  String? type ;
  IconType({@required this.icon,@required this.type});
  @override
  _IconTypeState createState() => _IconTypeState();
}
class _IconTypeState extends State<IconType> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(this.widget.icon,color: Colors.white,size: 80,),
        Text("${this.widget.type}",style:kTextStyle1),
      ],
    );
  }
}
