import 'package:coral_interview_task/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  final VoidCallback onTap; 
   final IconData icon;
  const CustomButton1({
    Key? key,
    required this.onTap, required this.icon, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap, 
      icon: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.primaryColor,
        ),
        height: 30,
        width: 30,
        child: Icon(
          icon,
          size: 20,
          color: ColorConstants.customWhite,
        ),
      ),
    );
  }
}
