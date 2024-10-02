import 'package:book_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key, required this.rating, required this.count,
  });
  final num rating ; 
  final num count ; 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          size: 12,
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 7.3,
        ),
        Text(rating.toString(), style: Styles.textStyle14.copyWith(color: Colors.white)),
        const SizedBox(
          width: 6,
        ),
         Text(
          "( ${count.toString()} ) ",
          style: Styles.textStyle14,
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
