import 'package:flutter/material.dart';
import 'package:hng_task3_shopper/models/product_item_model.dart';
import 'package:hng_task3_shopper/views/product_page/components/carousel_build.dart';
import 'package:hng_task3_shopper/views/product_page/components/home_banner_widget.dart';
import 'package:hng_task3_shopper/widgets/custom_appbar_widget.dart';
import 'components/product_title_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomAppBarHeader(title: 'Product List'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeBannerWidget(),
              const SizedBox(height: 20),
              const ProductTitleWidget(title: 'Tech Gadget'),
              CarouselBuilderWidget(productItemModel: techGadgetList),
              const SizedBox(height: 20),
              const ProductTitleWidget(title: "Men’s Fashion"),
              CarouselBuilderWidget(productItemModel: menFashionList),
              const SizedBox(height: 20),
              const ProductTitleWidget(title: "Women’s Fashion"),
              CarouselBuilderWidget(productItemModel: womenFashionList),
            ],
          ),
        ),
      ),
    );
  }
}
