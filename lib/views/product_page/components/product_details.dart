import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_task3_shopper/controllers/product_page_controller.dart';
import 'package:hng_task3_shopper/models/get_products_model.dart';
import 'package:hng_task3_shopper/models/product_item_model.dart';
import 'package:hng_task3_shopper/utils/colors.dart';
import 'package:hng_task3_shopper/utils/constants.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.products});
  final Item products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductPageController());
    String? productImage = products.photos.isNotEmpty
        ? '$imageUrl${products.photos[0].url}'
        : null;
    final double price = products.currentPrice[0].ngn[0];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 350,
                      child: productImage != null
                          ? Image.network(productImage)
                          : Image.asset('assets/empty.png', fit: BoxFit.fill),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        products.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        '₦ ${price.formatMoney}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: colorsClass.reddishColor),
                          onPressed: () {
                            ProductItemModel newItem = ProductItemModel(
                                image: productImage ?? '',
                                title: products.name,
                                subTitle: products.description,
                                price: price);
                            controller.addToCart(newItem);
                          },
                          child: const Center(child: Text('Add to Cart'))),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'More Details',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        products.description,
                        style: const TextStyle(color: Color(0xffaaa8a8)),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color: colorsClass.reddishColor,
                        shape: const CircleBorder(),
                        child: IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.arrow_back)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
