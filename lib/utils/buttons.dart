
import 'package:coral_interview_task/utils/colors.dart';
import 'package:coral_interview_task/utils/fonts.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text; // Required text for the button
  final VoidCallback onTap; // Required onTap function

  const CustomButton({
    super.key,
    required this.text, // Marking text as required
    required this.onTap, // Marking onTap as required
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Use the onTap passed via constructor
      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorConstants.primaryColor, // Custom color
        ),
        child: Center(
          child: Text(
            text, // Use the text passed via constructor
            style: Fonts.boldText,
          ),
        ),
      ),
    );
  }
}
