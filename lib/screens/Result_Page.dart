import 'package:dibloma_6_bmi/Model/Constant.dart';
import 'package:dibloma_6_bmi/Widgets/Reusable_Card.dart';
import 'package:flutter/material.dart';
class Result_Page extends StatefulWidget {
  String? Type_of_Result ;
  double? Result ;
  String? Text_of_Result ;
  Result_Page({required this.Result,required this.Text_of_Result,required this.Type_of_Result});
  @override
  _Result_PageState createState() => _Result_PageState();
}

class _Result_PageState extends State<Result_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator",style: kTextStyle2.copyWith(fontSize: 25),),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
              child: Text("Your Result",style: kTextStyle2.copyWith(fontSize: 50,),)),
          Expanded(
            flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReusableCard(
                  color: kActiveColor,
                  widget: Column(
                    children: [
                      Text("${this.widget.Type_of_Result}",style: kTextStyle2.copyWith(color: Colors.green,fontSize: 30),),
                      Text("${(this.widget.Result)}",style: kTextStyle2.copyWith(fontSize: 30)),
                      Text("${this.widget.Text_of_Result}",style: kTextStyle2.copyWith(fontSize: 25)),
                    ],
                  ),
                ),
              )),
          Expanded(
            flex: 1,
              child: InkWell(
                onTap: (){
                  setState(() {
                    kHeight=50;
                    kWeight=40;
                    kAge=20;
                  });
                  Navigator.pop(context);
                },
                child: Container(
            width: double.infinity,
            height: 80,
            color: Color(0xFFEB1555),
            child: Center(
                child: Text(
                  "RE_Calculat",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
          ),
              ),
             ),

        ],
      ),

    );
  }
}
