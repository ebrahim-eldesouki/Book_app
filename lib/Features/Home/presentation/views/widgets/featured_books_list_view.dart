import 'package:book_app/Core/utils/app_router.dart';
import 'package:book_app/Core/widgets/custom_error_widget.dart';
import 'package:book_app/Features/Home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:book_app/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 7),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
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
            ),
          );
        } else if (state is FeaturedBookFailure) {
          return CustomErrorWidget(errorMassage: state.errMassage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
