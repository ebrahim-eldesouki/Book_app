import 'package:book_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/Features/Search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future<void> fetchSearchedBooks({required String searchText}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchedBooks(searchText: searchText);
    result.fold(
      (failure) => emit(
        SearchFailure(failure.errormsg),
      ),
      (books) => emit(
        SearchSuccess(books),
      ),
    );
  }
}
