import 'package:book_app/Core/utils/styles.dart';
import 'package:book_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/Features/Home/presentation/views/widgets/books_action.dart';
import 'package:book_app/Features/Home/presentation/views/widgets/rating_row.dart';
import 'package:flutter/material.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          textAlign: TextAlign.center,
          bookModel.volumeInfo.title,
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          bookModel.volumeInfo.authors?[0] ?? '',
          style: Styles.textStyle14.copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          height: 4.5,
        ),
        RatingRow(
          count: bookModel.volumeInfo.ratingsCount ?? 0,
          rating: bookModel.volumeInfo.averageRating ?? 0,
        ),
        const SizedBox(
          height: 15,
        ),
         BooksAction( 
          bookModel: bookModel,
         ),
      ],
    );
  }
}
