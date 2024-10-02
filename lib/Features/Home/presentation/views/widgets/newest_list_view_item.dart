import 'package:book_app/Core/utils/app_router.dart';
import 'package:book_app/Core/utils/styles.dart';
import 'package:book_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:book_app/Features/Home/presentation/views/widgets/rating_row.dart';
import 'package:book_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestListViewItem extends StatelessWidget {
  const NewestListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kbookDetailsView ,extra: bookModel);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 13),
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              CustomBookImage(
                  imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        bookModel.volumeInfo.title,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGTSectraFine),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      bookModel.volumeInfo.authors![0],
                      style: Styles.textStyle14,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                     Row(
                      children: [
                        const Text(
                          r'Free $',
                          style: Styles.textStyle18,
                        ),
                        const Spacer(),
                        RatingRow(
                          count: bookModel.volumeInfo.ratingsCount?? 0,
                          rating: bookModel.volumeInfo.averageRating?.round()?? 0,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
