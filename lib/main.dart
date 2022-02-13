import 'package:dibloma_6_bmi/screens/Calculat_Page.dart';
import 'package:flutter/material.dart';
 main(){
   runApp(BMI());


 }
 class BMI extends StatelessWidget {

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Color(0xFF111639),
          ),
          scaffoldBackgroundColor: Color(0xFF111639),
        ),
       home: ClaculatePage(),
     );
   }
 }
