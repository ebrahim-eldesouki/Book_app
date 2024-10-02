// ignore_for_file: file_names, duplicate_ignore

import 'package:book_app/Core/widgets/custom_error_widget.dart';
import 'package:book_app/Features/Home/presentation/manager/newest_book_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'newest_list_view_item.dart';

class NewestBookListView extends StatelessWidget {
  const NewestBookListView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksCubitSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount:state.books.length ,
            itemBuilder: (context, index) =>  NewestListViewItem(
              bookModel: state.books[index],

            ),
          );
        } else if( state is NewestBooksCubitFailure){
          return CustomErrorWidget(errorMassage: state.errMassage) ; 
        }else {
          return const Center(child:  CircularProgressIndicator()) ; 
        }
      },
    );
  }
}
