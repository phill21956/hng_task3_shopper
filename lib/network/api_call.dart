import 'package:flutter/material.dart';
import 'package:hng_task3_shopper/models/get_products_model.dart';
import 'package:hng_task3_shopper/utils/constants.dart';
import 'package:hng_task3_shopper/utils/toast.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  Future<GetProductsModel> httpGetProducts() async {
    try {
      final res = await http
          .get(Uri.parse(
              "$baseUrl?organization_id=$organizationId&Appid=$apiId&Apikey=$apiKey"))
          .timeout(const Duration(seconds: 60));
      print('stats - ${res.statusCode}:${res.body}');
      if (res.statusCode == 200) {
        final response = getProductsModelFromJson(res.body);
        return response;
      }
      toast(
          title: 'Attention!!!',
          'Failed to load products: ${res.statusCode}',
          color: Colors.red);
      throw 'Failed to load products: ${res.statusCode}';
    } catch (e) {
      print('error-$e');
      toast(title: 'Attention!!!', '$e', color: Colors.red);
      throw 'Failed to load products';
    }
  }
}
