import 'package:coral_interview_task/utils/colors.dart';
import 'package:coral_interview_task/utils/fonts.dart';
import 'package:coral_interview_task/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
     Future.delayed(Duration(seconds: 5)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),),));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body:Container(
        child: Center(child: Text("E-Commerce Application",style: Fonts.headingFont,)),
      )
    );
  }
}