import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_task3_shopper/controllers/product_page_controller.dart';
import 'package:hng_task3_shopper/models/product_item_model.dart';
import 'package:hng_task3_shopper/utils/colors.dart';
import 'package:hng_task3_shopper/views/product_page/components/product_item_widget.dart';

class CarouselBuilderWidget extends StatelessWidget {
  const CarouselBuilderWidget({super.key, required this.productItemModel});
  final List<ProductItemModel> productItemModel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductPageController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
              height: 350,
              initialPage: 0,
              viewportFraction: 0.5,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              padEnds: false,
              disableCenter: true,
              onPageChanged: (index, reason) => controller.current),
          itemCount: productItemModel.length,
          itemBuilder: (context, index, realIndex) {
            final model = productItemModel[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductItemWidget(
                  image: model.image,
                  title: model.title,
                  subTitle: model.subTitle,
                  price: model.price,
                  onPressed: () {
                    ProductItemModel newItem = ProductItemModel(
                      image: model.image,
                      title: model.title,
                      subTitle: model.subTitle,
                      price: model.price,
                    );
                    controller.addToCart(newItem);
                  }),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () => controller.controller.value.animateToPage(index),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : colorsClass.reddishColor)
                      .withOpacity(
                          controller.current.value == index ? 0.9 : 0.4),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
