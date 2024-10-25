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
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

 
  void handleSignIn() {
   
    String name = nameController.text;
    String email = emailController.text;
    String phoneNumber = phoneNumberController.text;
    String pincode = pincodeController.text;
    print("Name: $name");
    print("Email: $email");
    print("Phone Number: $phoneNumber");
    print("Pincode: $pincode");


  if(nameController.text.isNotEmpty&&emailController.text.isNotEmpty){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Name And Email Are Required Parameters!!"),
            backgroundColor: Colors.red,
          ),
        );
  }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        titleText: "Sign-In Page",
        leadingIcon: Icon(
          Icons.arrow_back_ios,
          color: ColorConstants.customWhite,
        ),
        onTapIcon: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: ColorConstants.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormFieldWidget(
                controller: nameController,
                labelText: "Name",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormFieldWidget(
                controller: emailController,
                labelText: "Email",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormFieldWidget(
                controller: phoneNumberController,
                labelText: "Phone Number",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormFieldWidget(
                controller: pincodeController,
                labelText: "Pincode",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: "Sign-In",
                onTap: handleSignIn, 
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    pincodeController.dispose();
    super.dispose();
  }
}
