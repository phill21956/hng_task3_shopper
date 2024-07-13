import 'package:flutter/material.dart';
import 'package:hng_task3_shopper/models/product_item_model.dart';
import 'package:hng_task3_shopper/views/product_page/components/carousel_build.dart';
import 'package:hng_task3_shopper/views/product_page/components/home_banner_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/Malltiverse.png',
              width: 90,
            ),
            const SizedBox(width: 20),
            const Text(
              'Product List',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeBannerWidget(),
              const SizedBox(height: 20),
              const Text(
                'Tech Gadget',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              CarouselBuilderWidget(productItemModel: techGadgetList),
              const SizedBox(height: 20),
              const Text(
                "Men’s Fashion",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              CarouselBuilderWidget(productItemModel: menFashionList),
              const SizedBox(height: 20),
              const Text(
                "Women’s Fashion",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              CarouselBuilderWidget(productItemModel: womenFashionList),
            ],
          ),
        ),
      ),
    );
  }
}
