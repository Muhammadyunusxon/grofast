import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Model/ProductModel.dart';
import '../Style/style.dart';
import 'Imag_network.dart';

class GridProduct extends StatelessWidget {
  final ProductModel? product;

  const GridProduct({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: Style.bgProduct),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Stack(
            children: [
              CustomImageNetwork(
                height: 145,
                width: 149,
                image: product?.image,
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Style.red,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          7.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Text(
              product?.title ?? "",
              style: Style.textStyleBold(
                  textColor: Style.DarkTextColor, size: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: (product?.price ?? 0).toString(),
                      style: Style.textStylePrice(size: 14),
                    ),
                    TextSpan(
                      text: ' /kg',
                      style: Style.textStylePrice(
                          size: 10, textColor: Style.greyColor),
                    ),
                  ]),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 41,
                  width: 53,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomRight: Radius.circular(23)),
                    color: Style.primaryColor,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
