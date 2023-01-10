import 'package:flutter/material.dart';
import '../Model/ProductModel.dart';
import '../Style/style.dart';
import 'Imag_network.dart';

class HorizontalProduct extends StatelessWidget {
  final ProductModel? product;

  const HorizontalProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: Style.bgCategory),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(product?.title ?? ""),
                  ),
                  Text((product?.price ?? 0).toString()),
                ],
              )),
        ],
      ),
    );
  }
}