import 'package:book_app/Core/errors/failures.dart';
import 'package:book_app/Core/utils/api_service.dart';
import 'package:book_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/Features/Search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
 
  
  @override
  Future<Either<Failures, List<BookModel>>> fetchSearchedBooks({required String searchText}) async{
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=$searchText&filtering=free-ebooks');

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
