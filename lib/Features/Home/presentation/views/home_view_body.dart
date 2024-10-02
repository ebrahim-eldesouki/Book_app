import 'package:book_app/Core/utils/styles.dart';
import 'package:book_app/Features/Home/presentation/views/widgets/newest_book_list_view.dart';
import 'package:book_app/Features/Home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:book_app/Features/Home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics:  BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBooksListView(),
              Padding(
                padding: EdgeInsets.only(left: 18, top: 30,bottom: 20),
                child: Text(
                  'Newest Book',
                  style: Styles.textStyle18,
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: NewestBookListView(),
        ),

      ],
    );
  }
}
