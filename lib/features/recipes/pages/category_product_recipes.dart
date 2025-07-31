import 'package:flutter/material.dart';

import '../../common/widgets/appbar/my_app_bar.dart';

class CategoryProductDetails extends StatelessWidget {
  const CategoryProductDetails({
    super.key,
    required this.title,
    required this.activeIndex,
    required this.productDetails,
  });

  final String title;
  final int activeIndex;
  final Map productDetails;

  @override
  Widget build(BuildContext context) {
    print(productDetails);
    return Scaffold(
      appBar: MyAppBar(
        activeIndex: activeIndex,
        titleString: title,
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: 357,
              height: 337,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  width: double.infinity,
                  height: double.infinity,
                  productDetails['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
