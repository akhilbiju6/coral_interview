import 'package:coral_interview_task/utils/appbar_widget.dart';
import 'package:coral_interview_task/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(titleText: "Home-Page", leadingIcon:Icon(Icons.arrow_back_ios,color: ColorConstants.customWhite,), onTapIcon: () {
      },),
    );
  }
}