import 'package:coral_interview_task/utils/appbar_widget.dart';
import 'package:coral_interview_task/utils/buttons.dart';
import 'package:coral_interview_task/utils/colors.dart';
import 'package:coral_interview_task/utils/textformfield_widgets.dart';
import 'package:coral_interview_task/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController pincodeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(titleText: "Sign-In Page", leadingIcon:Icon(Icons.arrow_back_ios,color: ColorConstants.customWhite,),
      onTapIcon: () {
        Navigator.pop(context);
      },),
      backgroundColor: ColorConstants.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormFieldWidget(controller:nameController, labelText: "Name"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormFieldWidget(controller:nameController, labelText: "Email"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormFieldWidget(controller:nameController, labelText: "Phone Number"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormFieldWidget(controller:nameController, labelText: "Pincode"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(text: "Sign-In", onTap:() {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },),
            )
          ],
        ),
      ),
    );
  }
}