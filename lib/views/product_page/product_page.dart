import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_task3_shopper/controllers/product_page_controller.dart';
import 'package:hng_task3_shopper/views/product_page/components/carousel_build.dart';
import 'package:hng_task3_shopper/views/product_page/components/home_banner_widget.dart';
import 'package:hng_task3_shopper/widgets/custom_appbar_widget.dart';
import 'components/product_title_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductPageController());
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
              CarouselBuilderWidget(
                  itemModel: controller.getTechProduct()),
              const SizedBox(height: 20),
              const ProductTitleWidget(title: "Men’s Fashion"),
              CarouselBuilderWidget(
                  itemModel: controller.getMenProduct()),
              const SizedBox(height: 20),
              const ProductTitleWidget(title: "Women’s Fashion"),
              CarouselBuilderWidget(
                  itemModel: controller.getWomenProduct()),
            ],
          ),
        ),
      ),
    );
  }
}
