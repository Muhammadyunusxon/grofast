import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grofast/Components/state_widget.dart';

import '../Model/ProductModel.dart';
import '../Style/style.dart';
import '../store/LocalStore.dart';
import 'Imag_network.dart';

// ignore: must_be_immutable
class GridProduct extends StatefulWidget {
  final ProductModel? product;
   bool isLike;

   GridProduct({Key? key, this.product, required this.isLike}) : super(key: key);

  @override
  State<GridProduct> createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: Style.bgProduct),
      child: Column(
        children: [
          Stack(
            children: [
              CustomImageNetwork(
                height: 145,
                width: 149,
                image: widget.product?.image,
              ),
              Align(
                alignment: Alignment.topRight,
                child:   IconButton(
                  splashRadius: 15,
                  onPressed: () async {
                    widget.isLike = !widget.isLike;
                    if (widget.isLike) {
                      await LocalStore.setLikes(widget.product?.id ?? 0);
                      StateInheritedWidget.of(context)
                          .favourites
                          .add(widget.product?.id ?? 0);
                    } else {
                      await LocalStore.removeLikes(widget.product?.id ?? 0);
                      StateInheritedWidget.of(context).favourites.removeWhere(
                              (element) => element == widget.product?.id);
                    }
                    setState(() {});
                  },
                  icon: widget.isLike
                      ? Container(
                    height: 30,
                    width: 30,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(color: Style.red),
                        shape: BoxShape.circle),
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Style.red, shape: BoxShape.circle),
                      child: Icon(
                        Icons.favorite,
                        color: Style.white,
                        size: 10,
                      ),
                    ),
                  )
                      : Container(
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
              widget.product?.title ?? "",
              style: Style.textStyleBold(
                  textColor: Style.DarkTextColor, size: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          7.verticalSpace,
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: (widget.product?.price ?? 0).toString(),
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
