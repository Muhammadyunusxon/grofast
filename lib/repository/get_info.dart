import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/ProductModel.dart';

abstract class GetInfo {
  GetInfo._();

  static Future<List<ProductModel?>?> getProduct() async {
    try {
      final url = Uri.parse("https://fakestoreapi.com/products");
      final res = await http.get(url);
      return productModelFromJson(res.body);
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<List<String?>?> getCategories() async {
    try {
      final url = Uri.parse("https://fakestoreapi.com/products/categories");
      final res = await http.get(url);
      return json.decode(res.body) == null
          ? []
          : List<String?>.from(json.decode(res.body)!.map((x) => x));
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<List<ProductModel?>?> getCategoriesProduct(String category) async {
    try {
      final url = Uri.parse("https://fakestoreapi.com/products/category/$category");
      final res = await http.get(url);
      return productModelFromJson(res.body);
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<ProductModel?> geIDProduct(int id) async {
    try {
      final url = Uri.parse("https://fakestoreapi.com/products/$id");
      final res = await http.get(url);
      return ProductModel.fromJson(jsonDecode(res.body));
    } catch (e) {
      print(e);
    }
    return null;
  }


}
