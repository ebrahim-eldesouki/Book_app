import 'package:book_app/Core/utils/app_router.dart';
import 'package:book_app/Core/widgets/custom_error_widget.dart';
import 'package:book_app/Features/Home/presentation/manager/similar_book_cubit/similar_book_cubit.dart';
import 'package:book_app/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBookDetailsListView extends StatelessWidget {
  const SimilarBookDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
      builder: (context, state) {
        if (state is SimilarBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kbookDetailsView,
                        extra: state.books[index]);
                  },
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                            '',
                  ),
                ),
              ),
              itemCount: state.books.length,
            ),
          );
        } else if (state is SimilarBookFailure) {
          return CustomErrorWidget(errorMassage: state.errMassage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
