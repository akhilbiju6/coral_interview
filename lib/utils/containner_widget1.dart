import 'package:coral_interview_task/utils/colors.dart';
import 'package:coral_interview_task/utils/fonts.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final String image;
  final String productName;
  final String mrp;
  final VoidCallback ontap;

  const ContainerWidget({
    super.key,
    required this.image,
    required this.productName,
    required this.mrp,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: ColorConstants.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                productName,
                style: Fonts.boldText2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "MRP : $mrp",
                    style: Fonts.boldText2,
                  ),
                  InkWell(
                    onTap: () {
                     ontap();
                    },
                    child: Icon(
                      Icons.shopping_bag,
                      color: ColorConstants.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
