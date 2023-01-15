import 'package:flutter/material.dart';
import 'package:grofast/Components/state_widget.dart';
import 'package:grofast/Pages/HomePage/ProductPage.dart';
import 'package:grofast/repository/get_info.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../Components/GridProduct.dart';
import '../../Components/horizontal_product.dart';
import '../../Model/ProductModel.dart';
import '../../Style/style.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  RefreshController _refreshController=RefreshController();
  List<ProductModel?>? lifOfProduct = [];
  List<String?>? listOfCategories = [];
  bool isLoading = true;
  bool isHorizontal = true;
  bool isCategory = false;
  bool isRefresh = false;
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
    isRefresh = true;
    setState(() {});
    lifOfProduct?.clear();
    lifOfProduct = await GetInfo.getProduct();
    isRefresh = false;
    setState(() {});
  }

  getCategoryProduct(String category) async {
    isRefresh = true;
    setState(() {});
    lifOfProduct?.clear();
    lifOfProduct = await GetInfo.getCategoriesProduct(category);
    isRefresh = false;
    setState(() {});
  }

  getLikes() async {
    StateInheritedWidget.of(context).addAll();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.primaryColor,
        title: Text("Products"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Style.primaryColor,
            ))
          : SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        onLoading: () {},
        onRefresh: () async {
          if (category==-1){
            await getAllProduct();
          }else{
            await getCategoryProduct(listOfCategories![category]!);
          }
          _refreshController.refreshCompleted();
        },
            child: SingleChildScrollView(
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
                                  product: isRefresh ? null : lifOfProduct?[index],
                                  isLike: isRefresh ? false : StateInheritedWidget.of(context).favourites.contains(lifOfProduct?[index]?.id),
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
              ),
          ),
    );
  }
}
