import 'package:book_app/Core/utils/app_router.dart';
import 'package:book_app/Core/utils/service_locator.dart';
import 'package:book_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:book_app/Features/Home/presentation/manager/newest_book_cubit/newest_books_cubit.dart';
import 'package:book_app/Features/Home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:book_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setUpServiceLocator();
  runApp(const Bookoo());
}

class Bookoo extends StatelessWidget {
  const Bookoo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBookCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kprimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
