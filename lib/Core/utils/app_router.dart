import 'package:book_app/Core/utils/service_locator.dart';
import 'package:book_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:book_app/Features/Home/presentation/manager/similar_book_cubit/similar_book_cubit.dart';
import 'package:book_app/Features/Home/presentation/views/book_details_view.dart';
import 'package:book_app/Features/Home/presentation/views/home_view.dart';
import 'package:book_app/Features/Search/data/repos/search_repo_impl.dart';
import 'package:book_app/Features/Search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:book_app/Features/Search/presentation/views/search_view.dart';
import 'package:book_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const khomeView = '/homeView';
  static const kbookDetailsView = '/bookDetailsView';
  static const ksearchView = '/searchView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: khomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kbookDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SimilarBookCubit(
              getIt.get<HomeRepoImpl>(),
            ),
            child: BookDetailsView(
              bookModel: state.extra as BookModel,
            ),
          );
        },
      ),
      GoRoute(
        path: ksearchView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SearchCubit(
              getIt.get<SearchRepoImpl>(),
            ),
            child: const SearchView(),
          );
        },
      ),
    ],
  );
}
