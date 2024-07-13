import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hng_task3_shopper/utils/colors.dart';
import 'package:hng_task3_shopper/views/product_page/components/product_item_widget.dart';

class CarouselBuilderWidget extends StatefulWidget {
  const CarouselBuilderWidget({super.key});

  @override
  State<CarouselBuilderWidget> createState() => _CarouselBuilderWidgetState();
}

class _CarouselBuilderWidgetState extends State<CarouselBuilderWidget> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

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
          itemCount: 4,
          itemBuilder: (context, index, realIndex) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: ProductItemWidget(),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
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
