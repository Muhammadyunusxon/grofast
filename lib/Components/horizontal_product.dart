import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grofast/Components/state_widget.dart';
import 'package:grofast/store/LocalStore.dart';
import '../Model/ProductModel.dart';
import '../Style/style.dart';
import 'Imag_network.dart';

// ignore: must_be_immutable
class HorizontalProduct extends StatefulWidget {
  final ProductModel? product;
  bool isLike;

  HorizontalProduct({Key? key, required this.product, required this.isLike})
      : super(key: key);

  @override
  State<HorizontalProduct> createState() => _HorizontalProductState();
}

class _HorizontalProductState extends State<HorizontalProduct> {
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
              image: widget.product?.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.product?.title ?? "",
                style: Style.textStyleBold(
                    textColor: Style.DarkTextColor, size: 15),
                overflow: TextOverflow.ellipsis,
              ),
              10.verticalSpace,
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: (widget.product?.price ?? 0).toString(),
                    style: Style.textStylePrice(),
                  ),
                  TextSpan(
                    text: ' /kg',
                    style: Style.textStylePrice(
                        size: 14, textColor: Style.greyColor),
                  ),
                ]),
              )
            ],
          )),
          12.horizontalSpace,
          SizedBox(
            width: 53,
            child: Column(
              children: [
                IconButton(
                  splashRadius: 15,
                  onPressed: () async {
                    widget.isLike = !widget.isLike;
                    print(widget.isLike);
                    print(MyInheritedWidget.of(context).favourites);
                    if (widget.isLike) {
                      await LocalStore.setLikes(widget.product?.id ?? 0);
                      MyInheritedWidget.of(context)
                          .favourites
                          .add(widget.product?.id ?? 0);
                    } else {
                      await LocalStore.removeLikes(widget.product?.id ?? 0);
                      MyInheritedWidget.of(context).favourites.removeWhere(
                          (element) => element == widget.product?.id);
                    }
                    print(MyInheritedWidget.of(context).favourites);
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
                Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 41,
                    width: 53,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(23),
                          bottomRight: Radius.circular(23)),
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
