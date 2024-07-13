import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hng_task3_shopper/models/product_item_model.dart';
import 'package:hng_task3_shopper/utils/colors.dart';
import 'package:hng_task3_shopper/views/product_page/components/product_item_widget.dart';

List<ProductItemModel> cartItems = [];

class CarouselBuilderWidget extends StatefulWidget {
  const CarouselBuilderWidget({super.key, required this.productItemModel});
  final List<ProductItemModel> productItemModel;
  @override
  State<CarouselBuilderWidget> createState() => _CarouselBuilderWidgetState();
}

class _CarouselBuilderWidgetState extends State<CarouselBuilderWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  void _addToCart(ProductItemModel item) {
    setState(() {
      if (!cartItems.any((cartItem) => cartItem.title == item.title)) {
        cartItems.add(item);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${item.title} added to cart'),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${item.title} is already in the cart'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

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
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          itemCount: widget.productItemModel.length,
          itemBuilder: (context, index, realIndex) {
            final model = widget.productItemModel[index];
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
                    _addToCart(newItem);
                  }),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(index),
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
                      .withOpacity(_current == index ? 0.9 : 0.4),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
