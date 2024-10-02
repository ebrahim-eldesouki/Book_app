import 'package:book_app/Core/widgets/custom_error_widget.dart';
import 'package:book_app/Features/Home/presentation/views/widgets/newest_list_view_item.dart';
import 'package:book_app/Features/Search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:book_app/Features/Search/presentation/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSearchTextField(),
        const SizedBox(height: 5),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text('Search result', style: Styles.textStyle18),
        ),
        const SizedBox(height: 15),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchInitial) {
              return Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 200),
                        Icon(
                          Icons.search,
                          size: MediaQuery.of(context).size.width * 0.25,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        Text(
                          'Please enter book name or category to search',
                          style: Styles.textStyle20.copyWith(
                            fontSize: 23,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is SearchSuccess) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return NewestListViewItem(
                      bookModel: state.books[index],
                    );
                  },
                ),
              );
            } else if (state is SearchFailure) {
              return CustomErrorWidget(errorMassage: state.errMassage);
            } else {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        )
      ],
    );
  }
}