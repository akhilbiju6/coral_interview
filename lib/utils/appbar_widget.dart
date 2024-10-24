
import 'package:coral_interview_task/utils/colors.dart';
import 'package:coral_interview_task/utils/fonts.dart';
import 'package:flutter/material.dart';
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final Widget leadingIcon;
  final VoidCallback onTapIcon; // Add the onTap parameter

  const AppBarWidget({
    super.key,
    required this.titleText,
    required this.leadingIcon,
    required this.onTapIcon, // Include it in the constructor
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.primaryColor,
      leading: InkWell(
        onTap: onTapIcon, // Use the onTap callback
        child: leadingIcon,
      ),
      title: Text(
        titleText,
        style: Fonts.headingFont,
      ),
      centerTitle: true,
      actions: [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

