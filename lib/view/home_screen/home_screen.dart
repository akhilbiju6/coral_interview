import 'package:coral_interview_task/controller/splashscreen_controller/splashscreen_controller.dart';
import 'package:coral_interview_task/utils/appbar_widget.dart';
import 'package:coral_interview_task/utils/colors.dart';
import 'package:coral_interview_task/utils/containner_widget1.dart';
import 'package:coral_interview_task/view/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> openBox() async {
  await Hive.openBox('myBox');
  print("Hive Box Opened");
}

Future<void> addData(String name, String description, double mrp, String image) async {
  openBox();
  var box = Hive.box('myBox');

  // Get the existing product data from the box
  var productData = box.get('productData', defaultValue: <Map<String, dynamic>>[]);

  // Ensure that productData is a List<Map<String, dynamic>>
  List<Map<String, dynamic>> productList;
  if (productData is List<Map<String, dynamic>>) {
    productList = productData; // It's already in the correct format
  } else {
    productList = []; // Initialize an empty list if it's not
  }

  // Create a new product map
  Map<String, dynamic> newProduct = {
    'name': name,
    'description': description,
    'mrp': mrp,
    'image': image,
  };

  // Add the new product to the list
  productList.add(newProduct);

  // Save the updated list back to Hive
  await box.put('productData', productList);
}





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
               child: ContainerWidget(image:productList[index].image , productName:productList[index].title, mrp:productList[index].price.toString(),ontap: () {
               addData(productList[index].title, productList[index].description, productList[index].price, productList[index].image);
              print("Items Added To cart");
               },)
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
