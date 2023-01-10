import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Model/ProductModel.dart';
import '../Style/style.dart';
import 'Imag_network.dart';

class HorizontalProduct extends StatelessWidget {
  final ProductModel? product;

  const HorizontalProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: Style.bgProduct),
      margin: const EdgeInsets.only(bottom: 17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomImageNetwork(
              image: product?.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                product?.title ?? "",
                style: Style.textStyleBold(
                    textColor: Style.DarkTextColor, size: 15),
                overflow: TextOverflow.ellipsis,
              ),
              10.verticalSpace,
              RichText(text: TextSpan(
                  children:[
                    TextSpan(
                      text: (product?.price ?? 0).toString(),
                      style:  Style.textStylePrice(),
                    ),TextSpan(
                      text:' /kg',
                      style:  Style.textStylePrice(size: 14,textColor: Style.greyColor),
                    ),
                  ]
              ),)
            ],
          )),
          12.horizontalSpace,
          SizedBox(
            width: 53,
            child: Column(
              children: [
                IconButton(
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
                Spacer(),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 41,
                    width: 53,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(23),bottomRight: Radius.circular(23)),
                      color: Style.primaryColor,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
