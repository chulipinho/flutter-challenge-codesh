import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/app_colors.dart';

class RatingWidget extends StatelessWidget {
  final int rating;

  const RatingWidget({required this.rating, Key? key})
      : assert(rating >= 0 && rating <= 5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star_rounded,
          color: index >= rating ? AppColors.grey : AppColors.purple,
        ),
      ),
    );
  }
}
