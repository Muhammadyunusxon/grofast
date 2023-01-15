import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grofast/Components/Imag_network.dart';
import 'package:grofast/Model/ProductModel.dart';

import '../../Components/state_widget.dart';
import '../../Style/style.dart';
import '../../store/LocalStore.dart';

// ignore: must_be_immutable
class ProductPage extends StatefulWidget {
  final ProductModel? product;
  bool isLike;

  ProductPage({Key? key, required this.product, required this.isLike})
      : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height / 2 * 1.2,
              width: size.width,
              padding: EdgeInsets.only(top: 18, left: 20, right: 18),
              decoration: BoxDecoration(
                  color: Style.bgProduct,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(200, 45))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          width: 70,
                          height: 50,
                          child: Container(
                            height: 40,
                            width: 60,
                            padding: EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Style.greyColor.withOpacity(0.75)),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              size: 18,
                              color: Style.greyColor.withOpacity(0.9),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_bag_rounded,
                            size: 28,
                            color: Style.greyColor.withOpacity(0.9),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomImageNetwork(
                    width: double.infinity,
                    height: size.height / 2 * 0.7,
                    image: widget.product?.image,
                  ),
                  IconButton(
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2.5,
                    child: Text(
                      widget.product?.title ?? ' ',
                      style: Style.textStyleSemiBold(size: 28),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    height: 32,
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Style.greyColor)
                    ),
                    child: Text(
                      (widget.product?.rating?.rate ?? 0).toString(),
                      style: Style.textStyleSemiBold(size: 28),
                      overflow: TextOverflow.ellipsis,
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
