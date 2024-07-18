import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_task3_shopper/controllers/product_page_controller.dart';
import 'package:hng_task3_shopper/models/get_products_model.dart';
import 'package:hng_task3_shopper/models/product_item_model.dart';
import 'package:hng_task3_shopper/utils/colors.dart';
import 'package:hng_task3_shopper/utils/constants.dart';
import 'package:hng_task3_shopper/views/product_page/components/product_details.dart';
import 'package:hng_task3_shopper/views/product_page/components/product_item_widget.dart';
import 'package:hng_task3_shopper/widgets/service_loading.dart';

class CarouselBuilderWidget extends StatelessWidget {
  const CarouselBuilderWidget({super.key, required this.itemModel});
  final Future<List<Item>> itemModel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductPageController());
    return FutureBuilder(
        future: itemModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              snapshot.data == null) {
            return const ServiceLoading();
          } else if (snapshot.hasData) {
            final productItemModel = snapshot.data!;
            return CarouselCardWidget(
                controller: controller, productItemModel: productItemModel);
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: Text('Empty'));
          }
        });
  }
}

///CAROUSEL CARD
class CarouselCardWidget extends StatelessWidget {
  const CarouselCardWidget({
    super.key,
    required this.controller,
    required this.productItemModel,
  });

  final ProductPageController controller;
  final List<Item> productItemModel;

  @override
  Widget build(BuildContext context) {
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
              onPageChanged: (index, reason) => controller.onPageChange(index)),
          itemCount: productItemModel.length,
          itemBuilder: (context, index, realIndex) {
            final model = productItemModel[index];
            String? productImage = model.photos.isNotEmpty
                ? '$imageUrl${model.photos[0].url}'
                : null;
            final price = model.currentPrice[0].ngn[0];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductItemWidget(
                  image: productImage,
                  title: model.name,
                  subTitle: model.description,
                  price: price,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(products: model),
                    ));
                  },
                  onPressed: () {
                    ProductItemModel newItem = ProductItemModel(
                        image: productImage ?? '',
                        title: model.name,
                        subTitle: model.description,
                        price: price);
                    controller.addToCart(newItem);
                  }),
            );
          },
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(productItemModel.length - 1, (index) {
              return GestureDetector(
                onTap: () => controller.controller.value.animateToPage(index),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
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
        )
      ],
    );
  }
}
