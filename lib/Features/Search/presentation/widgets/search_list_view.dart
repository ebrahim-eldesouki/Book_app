import 'package:book_app/Core/utils/app_router.dart';
import 'package:book_app/Core/widgets/custom_error_widget.dart';
import 'package:book_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/Features/Home/presentation/manager/newest_book_cubit/newest_books_cubit.dart';
import 'package:book_app/Features/Home/presentation/views/widgets/newest_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, required this.bookModel});
final BookModel bookModel ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksCubitSuccess) {
          return SizedBox(
            height: 500,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.books.length,
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kbookDetailsView,
                          extra: state.books[index]);
                    },
                    child: NewestListViewItem(bookModel: state.books[index],)
                  ),
                ),
            ),
          );
        } else if (state is NewestBooksCubitFailure) {
          return CustomErrorWidget(errorMassage: state.errMassage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
