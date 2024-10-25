import 'package:coral_interview_task/utils/appbar_widget.dart';
import 'package:coral_interview_task/utils/colors.dart';
import 'package:coral_interview_task/utils/custom_button.dart';
import 'package:coral_interview_task/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> quantities = []; // List to track quantities for each product
  List<Map<String, dynamic>> productList = [];
  double total = 0.00;

  // Open Hive box
  Future<void> openBox() async {
    await Hive.openBox('myBox');
    print("Hive Box Opened");
  }

  // Read data from Hive
  void readData() async {
    await openBox();
    var box = Hive.box('myBox');

    final productData = box.get('productData', defaultValue: <Map<String, dynamic>>[]);

    if (productData is List<Map<String, dynamic>> && productData.isNotEmpty) {
      productList.clear(); 
      quantities.clear(); // Clear the quantities list

      for (var productDataItem in productData) {
        String productName = productDataItem['name'] ?? 'Unknown';
        String description = productDataItem['description'] ?? 'No description';
        String image = productDataItem['image'] ?? 'No image';
        double mrp = productDataItem['mrp']?.toDouble() ?? 0.0;

        productList.add({
          'name': productName,
          'description': description,
          'mrp': mrp,
          'image': image,
        });
        
        quantities.add(0); // Initialize quantity for each product
      }

      calculateTotal(); // Calculate total after loading products
      setState(() {}); // Update UI
    } else {
      print('No product data found or data is not in the expected format.');
    }
  }

  // Increment counter value
  void onIncrementTapped(int index) {
    setState(() {
      quantities[index]++;
      calculateTotal(); // Update total whenever the quantity changes
    });
  }

  // Decrement counter value
  void onDecrementTapped(int index) {
    setState(() {
      if (quantities[index] > 0) {
        quantities[index]--;
        calculateTotal(); // Update total whenever the quantity changes
      }
    });
  }

  // Calculate the total amount
  void calculateTotal() {
    total = 0.0; // Reset total
    for (int i = 0; i < productList.length; i++) {
      total += productList[i]['mrp'] * quantities[i]; // Update total with current quantities
    }
    setState(() {}); // Ensure UI is updated after total calculation
  }

  @override
  void initState() {
    super.initState();
    readData(); // Call readData to fetch product data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        titleText: "Cart-Screen",
        leadingIcon: Icon(Icons.arrow_back_ios, color: ColorConstants.customWhite,),
        onTapIcon: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                var product = productList[index]; // Get product at current index

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
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
                                color: ColorConstants.primaryColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(product['image']),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 180,
                                  child: Text(
                                    product['name'],
                                    style: Fonts.boldText2,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  width: 180,
                                  child: Text(
                                    product['description'],
                                    style: Fonts.normalText,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: Text(
                                    "MRP  : ${product['mrp']}",
                                    style: Fonts.boldText2,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomButton1(
                                        onTap: () {
                                          onIncrementTapped(index);
                                        },
                                        icon: Icons.add,
                                      ),
                                    ),
                                    Text(
                                      "Qty: ${quantities[index]}",
                                      style: Fonts.boldText2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomButton1(
                                        onTap: () {
                                          onDecrementTapped(index);
                                        },
                                        icon: Icons.remove,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: ColorConstants.primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Amount : ${total.toStringAsFixed(2)}", style: Fonts.boldText,),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: ColorConstants.accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Check-Out", style: Fonts.boldText2,)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
