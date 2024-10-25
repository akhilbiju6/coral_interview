import 'package:coral_interview_task/controller/splashscreen_controller/splashscreen_controller.dart';
import 'package:coral_interview_task/utils/appbar_widget.dart';
import 'package:coral_interview_task/utils/colors.dart';
import 'package:coral_interview_task/utils/containner_widget1.dart';
import 'package:coral_interview_task/view/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(titleText: "Home-Page", leadingIcon:Text(""), onTapIcon: () {
      },),
      floatingActionButton: Tooltip(
        message: "Visit Cart",
        child: FloatingActionButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
        },
        elevation: 10,
        child: Icon(Icons.shopping_bag,color: ColorConstants.customWhite,size: 30,),
        backgroundColor: ColorConstants.primaryColor,
        ),
      ),
      body: Obx(() {
        final controller= Get.put(SplashScreenController());
        List productList=controller.productList;
        if (productList.isNotEmpty) {
          return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 320) ,
            itemCount:productList.length ,
             itemBuilder:(context, index) {
             return  Padding(
               padding: const EdgeInsets.all(8.0),
               child: ContainerWidget(image:productList[index].image , productName:productList[index].title, mrp:productList[index].price.toString())
             );
            },  
            ),
          )
        ]
      );
        }else{
          return CircularProgressIndicator();
        }
      },)
    );
  }
}
