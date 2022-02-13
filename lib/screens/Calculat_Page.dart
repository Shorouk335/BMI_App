import 'package:dibloma_6_bmi/Model/Constant.dart';
import 'package:dibloma_6_bmi/Widgets/Reusable_Card.dart';
import 'package:dibloma_6_bmi/Widgets/Type_Icon.dart';
import 'package:dibloma_6_bmi/screens/Result_Page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dibloma_6_bmi/Model/Calculator_Brain.dart';

class ClaculatePage extends StatefulWidget {
  @override
  _ClaculatePageState createState() => _ClaculatePageState();
}

class _ClaculatePageState extends State<ClaculatePage> {
  Color MaleColor = kInActiveColor;
  Color FemaleColor = kInActiveColor;

  void ChangeColor(var number_Type) {
    setState(() {
      if (number_Type == 1) {
        if (MaleColor == kInActiveColor) {
          MaleColor = kActiveColor;
          FemaleColor = kInActiveColor;
        } else
          MaleColor = kInActiveColor;
      } else {
        if (FemaleColor == kInActiveColor) {
          FemaleColor = kActiveColor;
          MaleColor = kInActiveColor;
        } else
          FemaleColor = kInActiveColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Clalculator",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        ChangeColor(1);
                      },
                      child: ReusableCard(
                        color: this.MaleColor,
                        widget: IconType(
                          icon: FontAwesomeIcons.mars,
                          type: "Male",
                        ),
                      ),
                    )),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    ChangeColor(2);
                  },
                  child: ReusableCard(
                    color: this.FemaleColor,
                    widget: IconType(
                      icon: FontAwesomeIcons.venus,
                      type: "Female",
                    ),
                  ),
                ),
              )),
            ],
          )),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReusableCard(
                    color: kActiveColor,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: kTextStyle1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${kHeight}",
                              style: kTextStyle2,
                            ),
                            Text(
                              " cm",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbColor: Colors.white,
                              activeTrackColor: Color(0XFFEB1555),
                              inactiveTickMarkColor: Color(0XFFEB1599),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0)),
                          child: Slider(
                              activeColor: Color(0xFFEB1555),
                              inactiveColor: kInActiveColor,
                              min: 0,
                              max: 200,
                              value: kHeight.toDouble(),
                              onChanged: (double num) {
                                setState(() {
                                  kHeight = num.toInt();
                                });
                              }),
                        ),
                      ],
                    ),
                  ))),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReusableCard(
                      color: kActiveColor,
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: kTextStyle1,
                          ),
                          Text(
                            "$kWeight",
                            style: kTextStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      kWeight++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus),
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      kWeight--;
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReusableCard(
                    color: kActiveColor,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: kTextStyle1,
                        ),
                        Text(
                          "$kAge",
                          style: kTextStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    kAge++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus),
                            RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    kAge--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
          InkWell(
            onTap: (){
             var calc = CalculatorBrain(height: kHeight, weight: kWeight);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Result_Page(Result: calc.calculateBMI() ,
                  Type_of_Result: calc.getResult(),Text_of_Result: calc.getInterPretation(),);
              }),);
            },
            child: Container(
              width: double.infinity,
              height: 80,
              color: Color(0xFFEB1555),
              child: Center(
                child: Text(
                  "Calculat",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
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

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  void Function()? onPressed;
  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,color: Colors.white,),
      fillColor: Color(0XFF4C4F5E),
      // shape: CircleBorder(), to have a circul shape
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 60.0,
      onPressed: onPressed ,
    );
  }
}
