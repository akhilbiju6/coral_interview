import 'package:coral_interview_task/utils/appbar_widget.dart';
import 'package:coral_interview_task/utils/buttons.dart';
import 'package:coral_interview_task/utils/colors.dart';
import 'package:coral_interview_task/utils/custom_button.dart';
import 'package:coral_interview_task/utils/fonts.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int countervalue=0;

  onIncrementTapped(){
   countervalue++;
   setState(() {
     
   });
  }

  onDecrementTapped(){
   countervalue--;
   setState(() {
     
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(titleText: "Cart-Screen", leadingIcon: Icon(Icons.arrow_back_ios,color: ColorConstants.customWhite,), onTapIcon: () {
        Navigator.pop(context);
      },),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child:Card(
                  elevation: 10,
                  child: Container(
                    height: 220,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 300,
                            width: 140,
                            decoration: BoxDecoration(
                              color: ColorConstants.primaryColor
                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg" )
                              ),
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                child: Text("Product Name",style: Fonts.boldText2,)),
                              SizedBox(
                                height: 80,
                                child: Text("Product description",style:Fonts.normalText,)),
                              SizedBox(
                                height: 30,
                                child: Text("MRP  :  ",style: Fonts.boldText2,)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomButton1(onTap: () {
                                        onIncrementTapped();
                                      }, icon:Icons.add)
                                    ),
                                    Text("Qty:  $countervalue",style:Fonts.boldText2,),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: CustomButton1(onTap: () {
                                       onDecrementTapped();
                                     }, icon:Icons.remove),
                                   )
                                  ],
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              );
            },),
          )
        ],
      ),
    );
  }
}

