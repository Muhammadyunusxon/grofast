import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grofast/Components/Imag_network.dart';
import 'package:grofast/Model/ProductModel.dart';

import '../../Style/style.dart';

class ProductPage extends StatelessWidget {
  final ProductModel? product;

  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: size.height / 2 * 1.2,
              width: size.width,
              decoration: BoxDecoration(
                  color: Style.bgProduct,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(200, 45))),
              child: Column(
                children: [
                  41.verticalSpace,
                  Row(
                    children: [
                      30.horizontalSpace,
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Container(
                          height: 40,
                          width: 60,
                          padding: EdgeInsets.symmetric(vertical: 9),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Style.greyColor.withOpacity(0.75)),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            size: 19,
                            color: Style.greyColor.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomImageNetwork(
                    width: double.infinity,
                    height: size.height / 2 * 0.8,
                    image: product?.image,
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
