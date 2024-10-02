import 'package:book_app/Core/utils/styles.dart';
import 'package:book_app/Features/Home/presentation/views/widgets/similar_books_details_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSecion extends StatelessWidget {
  const SimilarBooksSecion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like :',
          style: Styles.textStyle14.copyWith(color: Colors.white),
        ),
        const SizedBox(
          height: 15,
        ),
        const SimilarBookDetailsListView(),
        const SizedBox(
          height: 14,
        )
      ],
    );
  }
}
