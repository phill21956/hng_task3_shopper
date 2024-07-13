import 'package:flutter/material.dart';
import 'package:hng_task3_shopper/utils/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductItemWidget extends StatelessWidget {
   ProductItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    this.onPressed,
  });
  final String image;
  final String title;
  final String subTitle;
  final String price;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            height: 184,
            width: 185,
            color: const Color(0xffededed),
            child: Image.asset(
              image,
            )),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Text(
          subTitle,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        ),
        CustomRatingBar(
            alignment: Alignment.bottomLeft,
            ignoreGestures: true,
            initialRating: 5,
            color: colorsClass.ratingColor),
        Text(
          price,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: colorsClass.reddishColor),
        ),
        const SizedBox(height: 5),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: colorsClass.reddishColor)),
          child: const Text('add to cart'),
        )
      ],
    );
  }
}

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    Key? key,
    this.alignment,
    this.ignoreGestures,
    this.initialRating,
    this.itemSize,
    this.itemCount,
    this.color,
    this.unselectedColor,
    this.onRatingUpdate,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final bool? ignoreGestures;

  final double? initialRating;

  final double? itemSize;

  final int? itemCount;

  final Color? color;

  final Color? unselectedColor;

  final Function(double)? onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: ratingBarWidget,
          )
        : ratingBarWidget;
  }

  Widget get ratingBarWidget => RatingBar.builder(
        ignoreGestures: ignoreGestures ?? false,
        initialRating: initialRating ?? 0,
        minRating: 0,
        direction: Axis.horizontal,
        itemSize: itemSize ?? 16.0,
        unratedColor: unselectedColor,
        itemCount: itemCount ?? 5,
        updateOnDrag: true,
        itemBuilder: (
          context,
          _,
        ) {
          return Icon(Icons.star, color: color);
        },
        onRatingUpdate: (rating) {
          onRatingUpdate!.call(rating);
        },
      );
}
