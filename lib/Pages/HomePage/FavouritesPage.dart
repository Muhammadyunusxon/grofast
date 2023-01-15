import 'package:flutter/material.dart';
import 'package:grofast/Components/horizontal_product.dart';
import 'package:grofast/Style/style.dart';

import '../../Components/GridProduct.dart';
import '../../Components/state_widget.dart';
import '../../Model/ProductModel.dart';
import '../../repository/get_info.dart';
import 'ProductPage.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  bool isRefresh = true;
  List<ProductModel?>? lifOfProduct = [];
  bool isHorizontal = true;

  getFavouriteProduct() async {
    print('Boshlandi');
    isRefresh = true;
    setState(() {});
    lifOfProduct?.clear();
    for(int i=0; i<StateInheritedWidget.of(context).favourites.length;i++){
      print(StateInheritedWidget.of(context).favourites[i]);
      ProductModel? product= await GetInfo.geIDProduct(StateInheritedWidget.of(context).favourites[i]);
      lifOfProduct?.add(product);
      isRefresh = false;
      setState(() {});
    }
    isRefresh = false;
    setState(() {});
    print('Tugadi');

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getFavouriteProduct();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.primaryColor,
        title: Text('Favourite page'),
      ),
      body: ListView(
        children: [ Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( "All Product"),
              IconButton(
                  onPressed: () {
                    isHorizontal = !isHorizontal;
                    setState(() {});
                  },
                  icon: Icon(isHorizontal ? Icons.menu : Icons.list))
            ],
          ),
        ),
          isHorizontal
              ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: 30, vertical: 25),
            itemCount: isRefresh ? 10 : lifOfProduct?.length ?? 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (!isRefresh) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProductPage(
                          product: lifOfProduct?[index],
                          isLike: isRefresh
                              ? false
                              : StateInheritedWidget.of(context)
                              .favourites
                              .contains(
                              lifOfProduct?[index]
                                  ?.id),
                        )));
                  }
                },
                child: HorizontalProduct(
                  product:
                  isRefresh ? null : lifOfProduct?[index],
                  isLike: isRefresh
                      ? false
                      : StateInheritedWidget.of(context)
                      .favourites
                      .contains(lifOfProduct?[index]?.id),
                  isRefresh: isRefresh,
                ),
              );
            },
          )
              : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: lifOfProduct?.length ?? 0,
              padding: EdgeInsets.symmetric(
                  horizontal: 30, vertical: 25),
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 210,
                crossAxisSpacing: 17,
                mainAxisSpacing: 17,
              ),
              itemBuilder: (context, index) => GridProduct(
                product: lifOfProduct![index],
                isLike: StateInheritedWidget.of(context)
                    .favourites
                    .contains(lifOfProduct?[index]?.id),
              )),
        ],
      ),
    );
  }
}
