import 'package:flutter/material.dart';
import 'package:grofast/repository/get_info.dart';
import '../../Components/horizontal_product.dart';
import '../../Model/ProductModel.dart';
import '../../Style/style.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ProductModel?>? lifOfProduct = [];
  List<String?>? listOfCategories = [];
  bool isLoading = true;
  bool isHorizontal = true;

  @override
  void initState() {
    getInformation();
    super.initState();
  }

  getInformation() async {
    isLoading = true;
    listOfCategories =await GetInfo.getCategories();
    lifOfProduct = await GetInfo.getProduct();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  itemCount:  listOfCategories?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Style.bgCategory),
                        padding: const EdgeInsets.all(8),
                        child: Center(child: Text(listOfCategories?[index] ?? '')));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("All Product"),
                  IconButton(onPressed: () {
                    isHorizontal = !isHorizontal;
                    setState(() {});
                  }, icon: Icon( isHorizontal ? Icons.menu : Icons.list))
                ],
              ),
            ),
            isHorizontal
                ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
              itemCount: lifOfProduct?.length ?? 0,
              itemBuilder: (context, index) {
                return HorizontalProduct(
                    product: lifOfProduct?[index]);
              },
            )
                : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: lifOfProduct?.length ?? 0,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) =>
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Placeholder(),
                    )),
          ],
        ),
      ),
    );
  }
}
