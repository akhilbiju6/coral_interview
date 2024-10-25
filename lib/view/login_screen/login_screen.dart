import 'package:coral_interview_task/controller/splashscreen_controller/splashscreen_controller.dart';
import 'package:coral_interview_task/utils/appbar_widget.dart';
import 'package:coral_interview_task/utils/buttons.dart';
import 'package:coral_interview_task/utils/colors.dart';
import 'package:coral_interview_task/utils/textformfield_widgets.dart';
import 'package:coral_interview_task/view/home_screen/home_screen.dart';
import 'package:coral_interview_task/view/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final controller = Get.put(SplashScreenController());
    // final Size size = MediaQuery.of(context).size;

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  void initState() {
   controller.productListfetch();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(titleText: "Login-Page", leadingIcon: Text(""),onTapIcon: () {
        
      },),
      backgroundColor: ColorConstants.backgroundColor,
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextFormFieldWidget(controller:emailController, labelText: "Email")
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextFormFieldWidget(controller:passwordController, labelText: "Password")
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomButton(text: "Log-In", onTap:() {
                 if(emailController.text=="akhilbiju66666@gmail.com"&&passwordController.text=="pa88word"){
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                   }else{
                      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Invalid email And Password"),
            backgroundColor: Colors.red,
          ),
        );
                  }
              },),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
                
                   
                },
                child: RichText(
                  text: TextSpan(
                    text: 'You dont have an account? ', 
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorConstants.primaryColor, 
                          fontWeight: FontWeight.bold, 
                        ),
                      ),
                    ],
                  ),
                ),
              )
            )
          ],
        ),

      ),
    );
  }

}


