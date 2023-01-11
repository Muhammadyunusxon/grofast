import 'package:flutter/material.dart';
import 'package:grofast/Components/state_widget.dart';
import 'package:grofast/Pages/HomePage/ProductPage.dart';
import 'package:grofast/repository/get_info.dart';
import '../../Components/GridProduct.dart';
import '../../Components/horizontal_product.dart';
import '../../Model/ProductModel.dart';
import '../../Style/style.dart';
import '../../store/LocalStore.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<ProductModel?>? lifOfProduct = [];
  List<String?>? listOfCategories = [];
  bool isLoading = true;
  bool isHorizontal = true;
  bool isCategory = false;
  int category = -1;

  @override
  void initState() {
    getInformation();
    super.initState();
  }

  getInformation() async {
    isLoading = true;
    setState(() {});
    listOfCategories = await GetInfo.getCategories();
    await getAllProduct();
    await getLikes();
    isLoading = false;
    setState(() {});
  }

  getAllProduct() async {
    isLoading = true;
    setState(() {});
    lifOfProduct?.clear();
    lifOfProduct = await GetInfo.getProduct();
    isLoading = false;
    setState(() {});
  }

  getCategoryProduct(String category) async {
    isLoading = true;
    setState(() {});
    lifOfProduct?.clear();
    lifOfProduct = await GetInfo.getCategoriesProduct(category);
    isLoading = false;
    setState(() {});
  }

  getLikes() async {
    print(MyInheritedWidget
        .of(context)
        .favourites);
    List<int> likes = await LocalStore.getLikes();
    MyInheritedWidget
        .of(context)
        .favourites
        .clear();
    MyInheritedWidget
        .of(context)
        .favourites
        .addAll(likes);
    print(MyInheritedWidget
        .of(context)
        .favourites);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.primaryColor,
        title: Text("Products"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 24),
                  shrinkWrap: true,
                  itemCount: listOfCategories?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        isCategory = !isCategory;
                        if (category == index) {
                          category = -1;
                          await getAllProduct();
                        } else {
                          category = index;
                          getCategoryProduct(listOfCategories![index]!);
                        }
                        setState(() {});
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: category == index
                                    ? Style.primaryColor
                                    : Style.shimmerBase,
                              ),
                              color: Style.bgCategory),
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child:
                              Text(listOfCategories?[index] ?? ''))),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(category != -1
                      ? listOfCategories![category] ?? ''
                      : "All Product"),
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
              itemCount: lifOfProduct?.length ?? 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
                        ProductPage(product: lifOfProduct?[index])
                    ));
                  },
                  child: HorizontalProduct(
                    product: lifOfProduct?[index],
                    isLike: MyInheritedWidget
                        .of(context)
                        .favourites
                        .contains(lifOfProduct?[index]?.id),
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
                  mainAxisExtent: 217,
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 17,
                ),
                itemBuilder: (context, index) =>
                    GridProduct(
                      product: lifOfProduct![index], isLike: MyInheritedWidget
                        .of(context)
                        .favourites
                        .contains(lifOfProduct?[index]?.id),
                    )),
          ],
        ),
      ),
    );
  }
}
